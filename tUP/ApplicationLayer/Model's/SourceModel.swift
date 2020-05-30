//
//  SourceModel.swift
//  tUP
//
//  Created by Home on 07.03.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct SourceModel: Decodable {
    
    let original: String
    let large: String
    let large2x: String
    let medium: String
    let small: String
    let portrait: String
    let landscape: String
    let tiny: String

    private enum CodingKeys: String, CodingKey {
              
        case original
        case large
        case large2x
        case medium
        case small
        case portrait
        case landscape
        case tiny

    }
}
