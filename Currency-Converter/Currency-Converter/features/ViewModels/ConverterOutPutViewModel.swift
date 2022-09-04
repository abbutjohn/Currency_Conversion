//
//  ConverterOutPutViewModel.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//

import Foundation


protocol  ConverterOutPutProtocol : AnyObject {
    
    func updateTimeLabel    (message : String )       -> Void
    func gotoStatusScreen   (status : Bool )          -> Void
    
}

class ConverterOutPutViewModel  {
    
    var gotAmount       :   Double = 0.0
    var sendAmount      :   Double = 0.0
    var sendCurrency    :   String = ""
    var gotCurrency     :   String = ""
    var count           =   30
    weak var timer      : Timer?
    weak var delegate   : ConverterOutPutProtocol?
    
    init(gotAmount : Double = 0.0, sendAmount: Double = 0.0, sendCurrency : String = "", gotCurrency : String = "") {
        
        self.gotAmount     =    gotAmount
        self.sendAmount    =    sendAmount
        self.sendCurrency  =    sendCurrency
        self.gotCurrency   =    gotCurrency
        self.timer         =    Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(self.setCalculations(_:)), userInfo: nil, repeats: true)

    }
        
    @objc func setCalculations(_ timer: Timer) {
        
        if(self.count > 0) {
            
            self.count = self.count - 1
            delegate?.updateTimeLabel(message: String(self.count) + " sec left")
        }
        else{
            
            delegate?.gotoStatusScreen(status: true)
        }
    }
    
    func getSendlabel() -> String {
        
        return String(self.sendAmount)    + " "   + self.sendCurrency
    }
    
    func gotlabel() -> String {
        
        return String(self.gotAmount)     + " "   + self.gotCurrency
    }
}
