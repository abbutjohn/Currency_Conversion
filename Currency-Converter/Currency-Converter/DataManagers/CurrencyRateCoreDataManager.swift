//
//  CurrencyRateCoreDataController.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//

import Foundation


protocol CurrencyRateCoreDatControllerProtocol {
    
    init()
    func saveAllValue(usdRateValues : CurrencyRate)
    func getValue(of Currency : String) -> Double
    func geLastUpdatedTime() -> Date
    
}

final class CurrencyRateCoreDataManager : CurrencyRateCoreDatControllerProtocol
{
    private let _currencyAndRateRepocitory = CurrencyAndRateRepocitory()
    
    init(){}

    func saveAllValue(usdRateValues : CurrencyRate){
        
        _currencyAndRateRepocitory.saveAllValue(usdRateValues: usdRateValues)
        
    }
    func getValue(of Currency : String) -> Double {
        
        return _currencyAndRateRepocitory.getValue(of: Currency)
    }
    
    func geLastUpdatedTime() -> Date {
        
        return _currencyAndRateRepocitory.getLastUpdatedDate()
    }
}


