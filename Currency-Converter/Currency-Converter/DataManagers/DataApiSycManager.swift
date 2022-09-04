//
//  DataApiSycManager.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//

import Foundation
import NetworkLayer
import NotificationCenter


protocol DataApiManagerProtocol{
    
    func getDataFromServerAndSaveToDb ()
}

class DataApiSycManager : DataApiManagerProtocol{
    
    var apiService                      = APICurrencyController()
    let CurrencyRateCoreDatController   : CurrencyRateCoreDatControllerProtocol = CurrencyRateCoreDataManager()
    weak var timer                      : Timer?
    let refreshTime: Double?

    init (refreshTime : Double = 18000.00){
        
        // Check data in Db - handled
        // Grab date and time which it last updated - handled
        // Find out current time - handled
        // if current time is more than 5 hour or equal to 5 hour then call the api - handled
        // After updation set a  timer for next 5 hour - handled
        // if network is failed then delete and show to user.- Not handled
        // Start again once network came - Not handled
        // if current time is less than 5 hour which the call happend - handled
        // Create a local timer for the next call with remaining time - handled
        
        self.refreshTime = refreshTime
        self.sheduler()
    }
    
    func sheduler () {
        
        let lastUpdatedDate     = self.CurrencyRateCoreDatController.geLastUpdatedTime()
        let diffComponents      = Calendar.current.dateComponents([.hour], from: Date(), to: lastUpdatedDate)
        let secounds            = diffComponents.second ?? 0

        if secounds >= Int(refreshTime ?? 18000.00) {
            
            self.getDataFromServerAndSaveToDb()
        }
        else{
            
            //Take data from Db
            
            self.shedulerStart(with: Double (secounds))

        }
    }
    
    
    func getDataFromServerAndSaveToDb() {
        
        self.shedulerStop()
                
        self.apiService.getAvailableCurrencyWithRate { (result: Result<CurrencyRate, Error>) in
            
            switch result {
            case .success(let resultValue):
                
                self.CurrencyRateCoreDatController.saveAllValue(usdRateValues: resultValue)
               
            case .failure(let error):
                
                print("Handle error \(error)")
            }
            
            self.shedulerStart(with: self.refreshTime ?? 18000.00)
        }
    }
    
}
extension DataApiSycManager{
    
    func shedulerStart(with  timeintervel : Double)  {
        
        self.timer = Timer.scheduledTimer(timeInterval: timeintervel,
                                          target:self,
                                          selector: #selector(self.setCalculationLs(_:)),
                                          userInfo: nil, repeats: true)
    }
    
    func shedulerStop()  {
        self.timer?.invalidate()
    }
      
    @objc func setCalculationLs(_ timer: Timer) {
        
        self.getDataFromServerAndSaveToDb()
    }
}
