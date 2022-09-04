//
//  peopleController.swift
//  VM_app
//
//  Created by Anumol Abraham Chakkungal on 29/05/2022.
//

import Foundation
import UIKit

class NetworkService {
    
    init(){
        //Init
    }
    // 1.
    class func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {

        //2
        var urlRequest = URLRequest(url: router.url)
        //3
        urlRequest.httpMethod = router.method
        // 4.
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            // 5.
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            
            // 6.
            let responseObject = try! JSONDecoder().decode(T.self, from: data)
            // 7.
            DispatchQueue.main.async {
                // 8.
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
}
