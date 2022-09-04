//
//  extentions.swift
//  Currency-Converter
//
//  Created by Anumol Abraham Chakkungal on 04/09/2022.
//

import Foundation


enum active {
    case from
    case To
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
