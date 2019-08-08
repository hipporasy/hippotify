//
//  BaseResponse.swift
//  Hippotify
//
//  Created by Marasy Phi on 8/4/19.
//  Copyright © 2019 Marasy Phi. All rights reserved.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let data: T
}
