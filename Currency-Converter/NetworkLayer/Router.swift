//
//  peopleController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Foundation


public enum API {
    
    static let key = "58a6ae8c59d235a32abbb6a0"

}
enum Router {
    
    // 1.
    case getAvailableCurrencyWithRate
    
    // 2.
    var scheme: String {
        switch self {
        case .getAvailableCurrencyWithRate:
            return "https"
        }
    }
    
    // 3.
    var host: String {
        switch self {
        case .getAvailableCurrencyWithRate:
            return "v6.exchangerate-api.com"
        }
    }
     
    // 4.
    var path: String {
        switch self {
        case .getAvailableCurrencyWithRate:
            return "/v6/" + API.key + "/latest/USD"
        }
    }
    // 5.
    var method: String {
        switch self {
        case .getAvailableCurrencyWithRate:
            return "GET"
        }
    }
    
    // 6.
    var parameters: [URLQueryItem] {
        switch self {
        case .getAvailableCurrencyWithRate:
            return []
        }
    }
    
    // 7
    var url: URL {
        
        switch self {
        case .getAvailableCurrencyWithRate:
            
            var components = URLComponents()
            components.scheme = scheme
            components.host = host
            components.path = path
            components.queryItems = nil
            guard let url = components.url else {
                preconditionFailure("Invalid URL components")
            }
            return url
        }
       
   }
}

