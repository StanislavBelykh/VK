//
//  MyFriendsController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 09/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class MyFriendsController: UITableViewController {

  public var myFriends:[Friend] = [
    Friend(name: "Friend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Friend 2", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend")]),
    Friend(name: "Friend 3", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend")]),
    Friend(name: "Friend 4", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend")]),
    Friend(name: "Friend 5", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "My_Friends")])
  ]
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return myFriends.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCells", for: indexPath) as! MyFriendsCell
        cell.myFriendNameLabel.text = myFriends[indexPath.row].name


        return cell
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "ShowPhoto",
        let photoViewController = segue.destination as? PhotoFriendController,
        let indexPath = tableView.indexPathForSelectedRow {
        let photoFriend = myFriends[indexPath.row].name
        photoViewController.photoFriendTitle = photoFriend
        let photosFriend = myFriends[indexPath.row].Photos
        photoViewController.photosToFriend = photosFriend as! [UIImage]
      }
    }
}

