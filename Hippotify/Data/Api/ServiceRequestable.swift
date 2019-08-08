//
//  ServiceRequestable.swift
//  Hippotify
//
//  Created by Marasy Phi on 7/29/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Alamofire

private let _decoder = JSONDecoder()

protocol ServiceRequestable: class {
    
    func request(_ api: DeezerApi, handler: @escaping (Data?, Error?) -> Void)
}

extension ServiceRequestable {
    
    
    func request(_ api: DeezerApi, handler: @escaping (Data?, Error?) -> Void) {
        Alamofire.request(api).responseData { responseData in
            guard let data = responseData.result.value else {
                return handler(nil, responseData.result.error)
            }
            handler(data, nil)
        }
    }
    
    func fetch<T: Decodable>(_ type: T.Type, for api: DeezerApi, handler: @escaping(T?, Error?) -> Void) {
        request(api) { (data, error) in
            guard let data = data else {
                return handler(nil, error)
            }
            guard let value = try? _decoder.decode(BaseResponse<T>.self, from: data) else {
                return handler(nil, NSError(domain: "Unable to decode data", code: 0, userInfo: [:]))
            }
            handler(value.data, nil)
        }
    }
    
}
