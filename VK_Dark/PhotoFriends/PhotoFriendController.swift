//
//  AllFriendsController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 10/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit


class PhotoFriendController: UICollectionViewController {

    public var photoFriendTitle = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
      title = photoFriendTitle
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoToFriendCell", for: indexPath) as! PhotoFriendsCell
    
        return cell
    }
}
