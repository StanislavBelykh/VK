//
//  MyFriendsCell.swift
//  VK_Dark
//
//  Created by Станислав Белых on 09/10/2018.
//  Copyright © 2018 Станислав Белых. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {

  @IBOutlet weak var myFriendNameLabel: UILabel!
  
  @IBOutlet weak var avatarImageView: AvatarImageView!
  
  @IBOutlet weak var shadowAvatarView: ShadowAvatarView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

@IBDesignable class AvatarImageView: UIImageView {
  

  override func awakeFromNib() {
    super.awakeFromNib()
    layer.cornerRadius = 25
    layer.masksToBounds = true
    
  }
}
@IBDesignable class ShadowAvatarView: UIView {
  @IBInspectable var shadowRadiusCustom: CGFloat = 5 {
    didSet {
      setNeedsDisplay()
    }
  }
  override func awakeFromNib() {
    layer.cornerRadius = 25
    layer.shadowOffset = .zero
    layer.shadowColor = UIColor.white.cgColor
    layer.shadowRadius = shadowRadiusCustom
    layer.shadowOpacity = 0.5
  }
}
