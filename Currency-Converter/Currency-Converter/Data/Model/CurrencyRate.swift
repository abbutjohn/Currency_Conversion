//
//  CurrencyRate.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 03/09/2022.
//

import Foundation

struct CurrencyRate : Decodable{
    
    let base_code : String
    let time_last_update_utc : String
    let time_next_update_utc : String
    let terms_of_use : String
    let result : String
    let conversionRate : Conversion_rates
}


struct Conversion_rates : Decodable {
    
    let USD : Double
    let GBP : Double
    let INR : Double
    let EUR : Double
    let RUB : Double
    let AED : Double
    let AUD : Double
    let CAD : Double
    let UYU : Double
    let NZD : Double
    
}
