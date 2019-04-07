//
//  AllGroupsController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 09/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class AllGroupsController: UITableViewController {

  
  var allGroups = [" Group 1", " Group 2", " Group 3", "Group 4", "Group 5", "Group 6", "Group 7", "Group 8"]
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "addGroupCellId", for: indexPath) as! AllGroupsCell
      cell.textLabel?.text = allGroups[indexPath.row]
      cell.textLabel?.textColor = .white
      return cell
  }
}
