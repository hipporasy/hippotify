//
//  ArtistRepository.swift
//  Hippotify
//
//  Created by Marasy Phi on 7/29/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation

protocol ArtistRepository {
    func search(keyword: String, handler: @escaping ([Artist]?, Error?)-> Void)
}

class DirectArtistRepository: ArtistRepository, ServiceRequestable {
    
    func search(keyword: String, handler: @escaping ([Artist]?, Error?) -> Void) {
        fetch([Artist].self, for: .searchArtist(keyword: keyword)) { (response, error) in
            guard error == nil, let response = response else {
                handler(nil, error)
                return
            }
            handler(response, nil)
        }
    }
}
