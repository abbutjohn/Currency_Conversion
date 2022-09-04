//
//  peopleController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Foundation


protocol ApiCurrencyrateProtocol {
    
    func getAvailableCurrencyWithRate<T : Codable>(_ completion: @escaping (Result<T, Error>) -> Void)
}

public class APICurrencyController : ApiCurrencyrateProtocol {
    
    
    public init(){}
    
    public func getAvailableCurrencyWithRate<T : Codable>(_ completion: @escaping (Result<T, Error>) -> Void) {
        
        NetworkService.request(router: Router.getAvailableCurrencyWithRate) { (result: Result<T, Error>) in
            switch result {
            case .success(let resultValue):
                completion(.success(resultValue))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}
