//
//  GetImageResponse.swift
//  PhotoApp
//
//  Created by Valerii on 30.05.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import Foundation


class GetImageResponse {
    
    
    var image: [ImageModel]
    
    init?(json: JSON) {
        guard let results = json["results"] as? [JSON] else {
            return nil
        }
        
        let image = results.map{ ImageModel(json: $0) }.compactMap{ $0 }
        self.image = image
    }
}
