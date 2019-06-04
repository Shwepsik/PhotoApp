//
//  MainCollectionView.swift
//  PhotoApp
//
//  Created by Valerii on 02.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import UIKit
import Kingfisher

class MainCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    let array = ["dogs","cats","animals","football","basketball","sport","wallpaper","food and drink","nature","travel"]

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.decelerationRate = .fast
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InspirationCell", for: indexPath) as! InspirationCell
        cell.sectionImage.image = UIImage(named: array[indexPath.row])
        cell.titleLabel.text = array[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyBoard.instantiateViewController(withIdentifier: "SelectedGroupController") as! SelectedGroupController
        nextView.search = array[indexPath.row]
        nextView.navigationItem.title = array[indexPath.row]
        navigationController?.pushViewController(nextView, animated: true)
    }
}
