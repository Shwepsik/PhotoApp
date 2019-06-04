//
//  Requst.swift
//  PhotoApp
//
//  Created by Valerii on 29.05.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: AnyObject]
typealias ResponseBlock = (_ result: Any?, _ error: Error?)
    -> Void


class RequestController {
    
    let header: HTTPHeaders = [
        "Authorization": "Client-ID 43f38197b6f10985088f7a86ac3d9dca5e437fc5cb9db42fd71b0130dddc2abc",
    ]
    
    static let shared = RequestController()
    
    let baseUrl: String = "https://api.unsplash.com"
    
    
    func tryLoadInfo(method: HTTPMethod, params: Parameters?, headers: HTTPHeaders?, path: String, responseBlock: @escaping ResponseBlock) {
        
        let fullPath: String = baseUrl + path
        
        if let url: URL = URL(string: fullPath) {
            
            request(url, method: method, parameters: params, headers: headers).validate().responseJSON { (responseJSON) in
                switch responseJSON.result {
                case .success:
                    guard let jsonArray = responseJSON.result.value as? JSON else {
                        return
                    }
                    responseBlock(jsonArray,nil)
                    
                case .failure(let error):
                    print(error)
                    responseBlock(nil,error)
                    
                }
            }
        }
    }
    
    func tryLoadImage(params: [String: Any], path: String, _ responseBlock: @escaping (GetImageResponse) -> Void) {
        tryLoadInfo(method: .get, params: params, headers: header, path: path) { (response, error) in
            if let json = response as? JSON {
                let imageResponse = GetImageResponse(json: json)
                responseBlock(imageResponse!)
            }
        }
    }
}



