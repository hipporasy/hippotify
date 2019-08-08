//
//  Album.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/4/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let id: Int
    let title: String
    let cover: String
    let rating: Int?
}

extension Album : BindableCell {
    
    var description: String {
        return "\(rating ?? 0)".description
    }
    
    var image: String {
        return cover
    }
    
}
