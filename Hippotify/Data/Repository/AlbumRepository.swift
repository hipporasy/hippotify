//
//  AlbumRepository.swift
//  Hippotify
//
//  Created by Marasy Phi on 7/29/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation

protocol AlbumRepository {
    func search(keyword: String, handler: @escaping ([Album]?, Error?)-> Void)
}

class DirectAlbumRepository: AlbumRepository, ServiceRequestable {
    
    func search(keyword: String, handler: @escaping ([Album]?, Error?) -> Void) {
        fetch([Album].self, for: .searchAlbum(keyword: keyword)) { (response, error) in
            guard error == nil, let response = response else {
                handler(nil, error)
                return
            }
            handler(response, nil)
        }
    }
}
