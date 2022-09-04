//
//  ConverterStatusViewModel.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//

import Foundation

protocol resetConvertionCalculatorProtocol : NSObject{
    
    func restCalculator (status : Bool) -> Void
}


class ConverterStatusViewModel  {
    
    var gotAmount       : Double = 0.0
    var sendAmount      : Double = 0.0
    var sendCurrency    : String = ""
    var gotCurrency     : String = ""
    
    
    init(gotAmount : Double = 0.0, sendAmount: Double = 0.0, sendCurrency : String = "", gotCurrency : String = "") {
        
        self.gotAmount     = gotAmount
        self.sendAmount    = sendAmount
        self.sendCurrency  = sendCurrency
        self.gotCurrency   = gotCurrency

    }
    
    
    func getMessage() -> String {
        
        return "Great now you have \(self.gotAmount)  \(self.gotCurrency) in you account. Your conversion rate was \(self.gotAmount/self.sendAmount)"
    }
}

