//
//  MeGroupsController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 09/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class MyGroupsController: UITableViewController {

  private var myGroups:[Group] = [
    Group(name: "Group 1")
  ]
  
  override func viewDidLoad() {
        super.viewDidLoad()
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyGroupsCell.reuseId, for: indexPath) as! MyGroupsCell
      cell.myGroup.text = myGroups[indexPath.row].name

        return cell
    }
  
  // Метод добавления группы по переходу по нажатию
  @IBAction func addGroup(segue: UIStoryboardSegue){
    
    if segue.identifier == "addGroup" {
      let allGroupsController = segue.source as! AllGroupsController
        if let indexPath = allGroupsController.tableView.indexPathForSelectedRow{
            let newGroup = allGroupsController.groups[indexPath.row]
          
          // Проверяем содержит ли мои группы группу с именем таким же как новвая группа и добавляем
          guard !myGroups.contains(where: {group -> Bool in return group.name == newGroup.name})
            else {return}
          myGroups.append(newGroup)
          // Обновить всю табличку
          tableView.reloadData()
        }
      }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
          myGroups.remove(at: indexPath.row)
          
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
