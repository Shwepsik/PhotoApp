//
//  FullScreenImage.swift
//  PhotoApp
//
//  Created by Valerii on 31.05.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import UIKit

class FullScreenImage: UIViewController {

    
    
    @IBOutlet weak var fullImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var twitter: UILabel!
    @IBOutlet weak var instagram: UILabel!
    var urlString = String()
    var userNameString = String()
    var twitterString = String()
    var instagramString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImage.kf.setImage(with: URL(string: urlString))
        userName.text = userNameString
        twitter.text = twitterString
        instagram.text = instagramString

    }
}
