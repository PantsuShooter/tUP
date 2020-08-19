//
//  SimpleModels.swift
//  tUP
//
//  Created by Home on 19.06.2020.
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


struct PhotosModel: Decodable {
    
    let page: Int
    let perPage: Int
    let totalResults: Int?
    let url: String?
    let nextPage: String
    let prevPage: String
    let photos: [PhotoModel]
    
    private enum CodingKeys: String, CodingKey {

        case page
        case perPage = "per_page"
        case totalResults = "total_results"
        case url
        case nextPage = "next_page"
        case prevPage = "prev_page"
        case photos
    }
}
