//
//  Track.swift
//  Hippotify
//
//  Created by Marasy Phi on 7/29/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation

struct Track: Decodable {
    let id: Int
    let readable: Bool
    let title: String
    let shortTitle: String
    let duration: Int
    let preview: URL
    let artist: Artist
    let album: Album
    
    enum CodingKeys: String, CodingKey {
        case id
        case readable
        case title
        case shortTitle = "title_short"
        case duration
        case preview
        case artist
        case album
    }
}

extension Track : BindableCell {
    
    var description: String {
        return shortTitle
    }
    
    var image: String {
        return album.cover
    }
    
}
