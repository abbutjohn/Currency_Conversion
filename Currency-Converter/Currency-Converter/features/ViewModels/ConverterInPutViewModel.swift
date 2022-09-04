//
//  ConverterInPutViewModel.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//

import Foundation


protocol convertionInputProtocol : AnyObject {
    
    func getConvertionRate (rate : Double , currency : String) -> Void
}

class ConverterInPutViewModel  {
    
    weak var delegate           : convertionInputProtocol?
    //Note : Controlling 10 currencies
    let currencyAvailableArray  = ["USD", "GBP", "INR", "EUR", "RUB", "AED", "AUD", "CAD", "UYU", "NZD"]
    var activeDropDown          : active = .To
    var rateConverter           : RateConverterProtocol

    
    init(rateConverter : RateConverterProtocol) {
        
        self.rateConverter = rateConverter
    }
    
    func convertedRate(currency from: String, to: String, amount : Double) {
        
        
        let value  = self.rateConverter.convertedRate(currency: from,
                                                to: to,
                                                amount: amount)
        
        delegate?.getConvertionRate(rate: value.0, currency: value.1)
    }
}
