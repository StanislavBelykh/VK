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
    public var photosToFriend:[UIImage] = []
    //public var allPhoto [Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
      title = photoFriendTitle
      
    }
  
  
    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosToFriend.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoToFriendCell", for: indexPath) as! PhotoFriendsCell
      cell.photoToFriend.image = photosToFriend[indexPath.item]
        return cell
    }
    @objc func cellLikePressed(_ sender: LikeControl) {
      print("The cell liked status set to: \(sender.isLiked).")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "ShowBigPhoto",
        let photoViewController = segue.destination as? BigPhotoFriendConroller,
        let _ = collectionView.indexPathsForSelectedItems {
        let photosFriend = photosToFriend
        photoViewController.bigPhotoFriend = photosFriend 
      }
    }
}
