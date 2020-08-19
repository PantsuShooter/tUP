//
//  NetworkManager.swift
//  tUP
//
//  Created by Home on 07.03.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import Alamofire

struct APPURL {
            
    static var apiKey = "563492ad6f91700001000001ab117dff83d54f16a787e8872143d4f0"

    private struct Domains {
        static let MainDomain = "https://api.pexels.com/"
    }
    
    private struct Routes {
        static let Api = "v1/"
    }
    static let Domain  = Domains.MainDomain
    private static let Route   = Routes.Api
    private static let BaseURL = Domain + Route
        
    static var curatedPhotos: String {return BaseURL + "curated"}
    static var photo: String {return BaseURL + "photos/" }
    static var searchPhotos: String {return BaseURL + "search" }

}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    public func getRandomPhoto(completionBlock: @escaping ( _ photo: PhotoModel?,  _ error: Error?) -> ()) {
        
        getCuratedPhoto(perPage: 1, page: Int.random(in: 0...1000)) { photosModel, error in
            completionBlock(photosModel?.photos[0], error)
        }
    }
        
    
    public func getCuratedPhoto(perPage: Int = 20, page: Int = 1, completionBlock: @escaping ( _ photo: PhotosModel?,  _ error: Error?) -> ()) {
        
        let headers = ["Authorization": APPURL.apiKey]

        let parameters = ["per_page" : perPage,
                          "page" : page] as [String : Any]
        
        Alamofire.request(APPURL.curatedPhotos, method: .get, parameters: parameters, headers: headers).responseJSON { response in
        
            switch response.result {
            case .success:
                if let data = response.data {
                    let photos = try? JSONDecoder().decode(PhotosModel.self, from: data)
                    completionBlock(photos,nil)
                } else {
                    let error = NSError.init(domain: response.result.debugDescription, code: 404, userInfo: nil)
                    completionBlock(nil, error)
                }
            case .failure(let error):
                if let error = error as NSError? {
                    completionBlock(nil, error)
                }
            }
        }
    }
}
