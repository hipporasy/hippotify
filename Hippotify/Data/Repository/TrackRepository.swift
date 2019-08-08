//
//  TrackRepository.swift
//  Hippotify
//
//  Created by Marasy Phi on 7/29/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation

protocol TrackRepository {
    func search(keyword: String, handler: @escaping ([Track]?, Error?)-> Void)
}

class DirectTrackRepository: TrackRepository, ServiceRequestable {
    
    func search(keyword: String, handler: @escaping ([Track]?, Error?) -> Void) {
        fetch([Track].self, for: .searchTrack(keyword: keyword)) { (response, error) in
            guard error == nil, let response = response else {
                handler(nil, error)
                return
            }
            handler(response, nil)
        }
    }
}
