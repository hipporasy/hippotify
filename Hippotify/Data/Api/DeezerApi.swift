//
//  DeezerApi.swift
//  Hippotify
//
//  Created by Marasy Phi on 7/29/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation
import Alamofire

enum DeezerApi : URLRequestConvertible {
    
    private static let BASE_URL = "https://api.deezer.com/"
    
    case searchArtist(keyword: String)
    case searchAlbum(keyword: String)
    case track
    case searchTrack(keyword: String)
    
    func asURLRequest() throws -> URLRequest {
        return try encodingMethod.encode(urlRequest, with: parameters)
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var encodingMethod: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var url: URL {
        var relativePath: String = ""
        switch self {
        case .searchTrack:
            relativePath = "/search/track"
        case .searchAlbum:
            relativePath = "/search/album"
        case .searchArtist:
            relativePath = "/search/artist"
        default:
            break
        }
        return URL(string: DeezerApi.BASE_URL + "\(relativePath)")!
    }
    
    var isAllowAuthentication: Bool {
        return false
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .searchTrack(keyword: let keyword):
            return ["q": keyword]
        case .searchArtist(keyword: let keyword):
            return ["q": keyword]
        case .searchAlbum(keyword: let keyword):
            return ["q": keyword]
        default:
            return nil
        }
    }
    
    var urlRequest: URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 30
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
    
}
