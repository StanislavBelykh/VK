//
//  PostTableViewCell.swift
//  VK_Dark
//
//  Created by Станислав Белых on 28/04/2019.
//  Copyright © 2019 Станислав Белых. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static let reuseId = "PostCell"
    @IBOutlet weak var repostView: UIView!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var likeControlView: LikeControl!
    @IBOutlet weak var countViewLable: UILabel!
    @IBOutlet weak var countLikeLable: UILabel!
    @IBOutlet weak var photoForPost: UIImageView!
    @IBOutlet weak var nameFriendForPost: UILabel!
    
    @IBOutlet weak var logoFriendForPost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
