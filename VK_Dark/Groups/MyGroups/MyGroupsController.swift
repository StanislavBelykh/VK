//
//  MeGroupsController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 09/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class MyGroupsController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
        {
        didSet{
            searchBar.delegate = self
        }
    }
    private var myGroups:[Group] = [
        Group(name: "Group 1")
    ]
    private var filterMyGroup = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterMyGroup = myGroups
    }
    
    private func filterGroup (with text: String){
        filterMyGroup = myGroups.filter { group in
            return group.name.lowercased().contains(text.lowercased())
            
        }
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterMyGroup.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyGroupsCell.reuseId, for: indexPath) as! MyGroupsCell
        cell.myGroup.text = filterMyGroup[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let city = filterMyGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            if let index = myGroups.firstIndex(where: { $0.name == city.name  }) {
                myGroups.remove(at: index)
            }
        }
    }
    
    // Метод добавления группы по переходу по нажатию
    @IBAction func addGroup(segue: UIStoryboardSegue){
        
        if segue.identifier == "addGroup" {
            let allGroupsController = segue.source as! AllGroupsController
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow{
                let newGroup = allGroupsController.groups[indexPath.row]
                
                // Проверяем содержит ли мои группы группу с именем таким же как новая группа и добавляем
                guard !myGroups.contains(where: {group -> Bool in return group.name == newGroup.name})
                    else {return}
                myGroups.append(newGroup)
                filterMyGroup = myGroups
                // Обновить всю табличку
                tableView.reloadData()
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            myGroups.remove(at: indexPath.row)
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}
extension MyGroupsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterMyGroup = myGroups
            tableView.reloadData()
            return
        }
        
        filterGroup(with: searchText)
    }
}
