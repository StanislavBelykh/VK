//
//  MyFriendsController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 09/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class MyFriendsController: UITableViewController{
    
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    

  public var myFriends:[Friend] = [
    Friend(name: "Дима", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Friend 2", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend")]),
    Friend(name: "Friend 3", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend")]),
    Friend(name: "Friend 4", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend")]),
    Friend(name: "Griend 5", Photos: [UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "Friend"),UIImage(named: "My_Friends")]),
    Friend(name: "Ariend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Briend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Criend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Driend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Eriend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Hriend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Lriend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Mriend 1", Photos: [UIImage(named: "Friend")]),
    Friend(name: "Nriend 1", Photos: [UIImage(named: "Friend")])
  ]
  public var filterMyFriend = [Friend]()
    
  public var friendsDictionary = [String: [String]]()
  public var friendSectionTitles = [String]()
  public var friends = [String]()
  
  var firstLetterOfName:[Character] = []
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    filterMyFriend = myFriends
      
      for friend in filterMyFriend {
        let friendKey = String(friend.name.prefix(1))
        if var friendValues = friendsDictionary[friendKey] {
          friendValues.append(friend.name)
          friendsDictionary[friendKey] = friendValues
        }else{
          friendsDictionary[friendKey] = [friend.name]
        }
        
      }
      
      friendSectionTitles = [String](friendsDictionary.keys)
      friendSectionTitles = friendSectionTitles.sorted(by:{ $0 < $1})
  

    }
    private func filterFriend (with text: String) {
        filterMyFriend = myFriends.filter { friend in
            return friend.name.lowercased().contains(text.lowercased())
        }
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return friendSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      let friendKey = friendSectionTitles[section]
      if let friendValues = friendsDictionary[friendKey] {
        return friendValues.count
      }
    
        return 0
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myFriendsCells", for: indexPath) as! MyFriendsCell
      let friendKey = friendSectionTitles[indexPath.section]
      if let friendValues = friendsDictionary[friendKey] {
        cell.myFriendNameLabel.text = friendValues[indexPath.row]
      }
      
        return cell
    }
    //Отображение секций таблицы
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
 
    return friendSectionTitles[section]
  }
   
  override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return friendSectionTitles
  }
  //Передача заголовка и фотографий
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
    //Расширение для search bar 
extension MyFriendsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterMyFriend = myFriends
            tableView.reloadData()
            return
        }
        
        filterFriend(with: searchText)
    }
}
