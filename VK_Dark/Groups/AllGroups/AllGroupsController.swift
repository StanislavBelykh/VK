//
//  AllGroupsController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 09/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class AllGroupsController: UITableViewController {

  
  
  public let groups:[Group] = [
    Group(name: "Group 1"),
    Group(name: "Group 2"),
    Group(name: "Group 3"),
    Group(name: "Group 4"),
    Group(name: "Group 5"),
    Group(name: "Group 6"),
    Group(name: "Group 7"),
    Group(name: "Group 8"),
    Group(name: "Group 9")
  ]

  override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: AllGroupsCell.reuseId, for: indexPath) as! AllGroupsCell
      cell.groupName.text = groups[indexPath.row].name
      cell.groupName.textColor = .white
      return cell
  }
}
