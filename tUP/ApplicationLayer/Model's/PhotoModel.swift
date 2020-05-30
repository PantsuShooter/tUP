//
//  PhotoModel.swift
//  tUP
//
//  Created by Home on 07.03.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct PhotoModel: Decodable {
    
    let width: Double
    let height: Double
    let url: String
    let photographer: String
    let source: SourceModel
    
    private enum CodingKeys: String, CodingKey {
              
        case width
        case height
        case url
        case photographer
        case source = "src"

    }
}
