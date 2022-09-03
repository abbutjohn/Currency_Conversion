//
//  CurrencyRateController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Foundation
import Combine
import NetworkLayer


// MARK: - Rooms Controller

protocol CurrencyRateControllerProtocol: AnyObject {

    func getAVailableRooms() -> AnyPublisher<CurrencyRate, APIError>
}

final class CurrencyRateController: CurrencyRateControllerProtocol {
    
    let networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func getAVailableRooms() -> AnyPublisher<CurrencyRate, APIError> {
        
        let endpoint = ApiFeeds.getConversionRate
        
        return networkController.get(type: CurrencyRate.self,
                                     url: endpoint.url,
                                     headers: [:])
    }
    
}
