//
//  SelectedGroupController.swift
//  PhotoApp
//
//  Created by Valerii on 02.06.2019.
//  Copyright © 2019 Valerii. All rights reserved.
//

import UIKit
import collection_view_layouts

class SelectedGroupController: UICollectionViewController, ContentDynamicLayoutDelegate {
    
    let size = CGSize(width: 180, height: 180)
    let request = RequestController()
    var search = String()
    var page = 1
    var imageArray = [ImageModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        request.tryLoadImage(params: ["query": search,"page": page], path: "/search/photos") { (model) in
            self.imageArray = model.image
            self.page += 1
            print(self.imageArray.count)
            self.collectionView.reloadData()
        }
    }
    
    func setUpLayout() {
        let contentFlowLayout: ContentDynamicLayout = FlickrStyleFlowLayout()
        
        contentFlowLayout.delegate = self
        contentFlowLayout.contentPadding = ItemsPadding(horizontal: 10, vertical: 10)
        contentFlowLayout.cellsPadding = ItemsPadding(horizontal: 8, vertical: 8)
        contentFlowLayout.contentAlign = .left
        
        collectionView.collectionViewLayout = contentFlowLayout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SelectedGroupCell
        cell.selectedGroupImage.kf.setImage(with: URL(string: (imageArray[indexPath.row].smallImage)))
        // Configure the cell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storyBoard.instantiateViewController(withIdentifier: "FullScreenImage") as! FullScreenImage
        nextView.urlString = imageArray[indexPath.row].regularImage
        nextView.userNameString = imageArray[indexPath.row].userName!
        nextView.twitterString = imageArray[indexPath.row].twitter!
        nextView.instagramString = imageArray[indexPath.row].instagram!
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastElement = imageArray.count - 1
        if indexPath.row == lastElement {
            request.tryLoadImage(params: ["query": search,"page": page], path: "/search/photos") { (model) in
                self.imageArray.append(contentsOf: model.image)
                self.page += 1
                self.collectionView.reloadData()
            }
        }
    }
    
    func cellSize(indexPath: IndexPath) -> CGSize {
        return size
    }

}
