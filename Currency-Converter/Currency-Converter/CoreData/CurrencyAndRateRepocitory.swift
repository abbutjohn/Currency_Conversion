//
//  CoreDataManager.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 03/09/2022.
//

import Foundation
import CoreData
import UIKit

protocol CurrencyAndRateRepocitoryProtocol{
    
    func saveAllValue(usdRateValues : CurrencyRate)
    func getValue(of Currency : String) -> Double
    func getLastUpdatedDate() -> Date
    func deleteAll() -> Void
    
}

class CurrencyAndRateRepocitory : CurrencyAndRateRepocitoryProtocol {
    
    
    var context : NSManagedObjectContext
    
    init(){
        
        context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    }
 
    func saveAllValue(usdRateValues : CurrencyRate) {
        
        
        let USD  = CurrencyValueInUSD(context: context)
        USD.id = "USD"
        USD.rate  = usdRateValues.conversion_rates.USD ?? 0.0
        USD.upDated = Date()
        
        let GBP  = CurrencyValueInUSD(context: context)
        GBP.id = "GBP"
        GBP.rate  = usdRateValues.conversion_rates.GBP ?? 0.0
        GBP.upDated = Date()
        
        let INR  = CurrencyValueInUSD(context: context)
        INR.id = "INR"
        INR.rate  = usdRateValues.conversion_rates.INR ?? 0.0
        INR.upDated = Date()
        
        
        let EUR  = CurrencyValueInUSD(context: context)
        EUR.id = "EUR"
        EUR.rate  = usdRateValues.conversion_rates.EUR ?? 0.0
        EUR.upDated = Date()
        
        let RUB  = CurrencyValueInUSD(context: context)
        RUB.id = "RUB"
        RUB.rate  = usdRateValues.conversion_rates.RUB ?? 0.0
        RUB.upDated = Date()
        
        let AED  = CurrencyValueInUSD(context: context)
        AED.id = "AED"
        AED.rate  = usdRateValues.conversion_rates.AED ?? 0.0
        AED.upDated = Date()
        
        let AUD  = CurrencyValueInUSD(context: context)
        AUD.id = "AUD"
        AUD.rate  = usdRateValues.conversion_rates.AUD ?? 0.0
        AUD.upDated = Date()
        
        
        let CAD  = CurrencyValueInUSD(context: context)
        CAD.id = "CAD"
        CAD.rate  = usdRateValues.conversion_rates.CAD ?? 0.0
        CAD.upDated = Date()

        
        let UYU  = CurrencyValueInUSD(context: context)
        UYU.id = "UYU"
        UYU.rate  = usdRateValues.conversion_rates.UYU ?? 0.0
        UYU.upDated = Date()

        
        let NZD  = CurrencyValueInUSD(context: context)
        NZD.id = "NZD"
        NZD.rate  = usdRateValues.conversion_rates.NZD ?? 0.0
        NZD.upDated = Date()

        
        do {
            try context.save()
        } catch  {
            print("error")
        }
    }
    
    
    func getValue(of Currency: String) -> Double {
        
        let fetchRequest = NSFetchRequest<CurrencyValueInUSD>(entityName: "CurrencyValueInUSD")
        let predicate = NSPredicate(format: "id==%@", Currency)
        fetchRequest.predicate = predicate
        
        do {
            
            let result = try context.fetch(fetchRequest).first?.rate
            guard result != nil else { return 0.0 }
            return result!

        } catch let error {
            
            debugPrint(error)
        }

        return 0.0

    }
    
    func getLastUpdatedDate() -> Date{
        
        //Note :All the data filling from server at  same time
        let fetchRequest = NSFetchRequest<CurrencyValueInUSD>(entityName: "CurrencyValueInUSD")
        
        do {
            let result = try context.fetch(fetchRequest).first?.upDated
            guard result != nil else { return Date() }
            return Date()

        } catch let error {
            
            debugPrint(error)
        }
        return Date()
    }
    
    func deleteAll() {
        
        // Not implimented
    }
}
