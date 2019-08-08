//
//  Artist.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/4/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation

struct Artist: Decodable {
    let id: Int
    let name: String
    let link: URL
    let picture: String
    var fanNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case link
        case picture
        case fanNumber = "nb_fan"
    }
}

extension Artist : BindableCell {
    
    var title: String {
        return name
    }
    
    var description: String {
        return "Has \(fanNumber ?? 0) fans"
    }
    
    var image: String {
        return picture
    }

}
