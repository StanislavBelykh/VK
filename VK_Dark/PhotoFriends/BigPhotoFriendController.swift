//
//  BigPhotoFriend.swift
//  VK_Dark
//
//  Created by Станислав Белых on 13/04/2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import UIKit


class BigPhotoFriendConroller: UIViewController {
  
  public var bigPhotoFriend:[UIImage] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  @IBOutlet var collectionView: UICollectionView! {
    didSet {
      collectionView.dataSource = self
      collectionView.delegate = self
    }
  }
}

extension BigPhotoFriendConroller: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return bigPhotoFriend.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigPhotoToFriendCell", for: indexPath) as! BigPhotoFriendCell
    cell.BigPhotoFriendView.image = bigPhotoFriend[indexPath.item]
    return cell
    
  }
  
  
}

extension BigPhotoFriendConroller: UICollectionViewDelegate{
  
}
