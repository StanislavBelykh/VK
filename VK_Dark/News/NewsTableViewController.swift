//
//  NewsTableViewController.swift
//  VK_Dark
//
//  Created by Станислав Белых on 28/04/2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var news = ["News 1","News 2","News 3","News 4","News 5"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseId, for: indexPath) as! PostTableViewCell
        return cell
    }
}
