//
//  RateCalculationManager.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//

import Foundation


protocol RateConverterProtocol {
    
    func convertedRate(currency from: String, to: String, amount : Double) -> (Double , String)
}

class RateCalculationManager : RateConverterProtocol{
    
    let CurrencyRateCoreDatController           : CurrencyRateCoreDatControllerProtocol
    
    init ( CurrencyRateCoreDatController : CurrencyRateCoreDatControllerProtocol ){
        
        self.CurrencyRateCoreDatController  = CurrencyRateCoreDatController
    }
    
    func convertedRate(currency from: String, to: String, amount : Double) -> (Double , String) {
        
        //USD consider as the base amount
        
        let fromInUSD       = 1 / CurrencyRateCoreDatController.getValue(of: from)
        let toInUSD         = 1 / CurrencyRateCoreDatController.getValue(of: to)
        
        let fromAmountInUSD = fromInUSD * amount
        let toAmountInUSD   =  fromAmountInUSD / toInUSD
        
        return (toAmountInUSD , to)
    }
    
}
