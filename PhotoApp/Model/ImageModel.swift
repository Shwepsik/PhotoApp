//
//  ImageModel.swift
//  PhotoApp
//
//  Created by Valerii on 30.05.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import Foundation
import UIKit

struct ImageModel {
    
    var instagram: String?
    var userName: String?
    var twitter: String?
    var regularImage: String
    var smallImage: String
    

    init?(json: JSON) {
        guard let user = json["user"] as? [String: AnyObject],
        let urls = json["urls"] as? [String: AnyObject],
        let regularImage = urls["regular"] as? String,
        let smallImage = urls["small"] as? String else {
            return nil
        }
        let instagram = user["instagram_username"] as? String ?? ""
        let userName = user["username"] as? String ?? ""
        let twitter = user["twitter_username"] as? String ?? ""
        
        self.instagram = instagram
        self.regularImage = regularImage
        self.smallImage = smallImage
        self.twitter = twitter
        self.userName = userName
    }
}
