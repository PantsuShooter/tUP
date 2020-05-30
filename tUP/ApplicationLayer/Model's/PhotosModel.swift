//
//  PhotosModel.swift
//  tUP
//
//  Created by Home on 07.03.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

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
