//
//  AvatarCell.swift
//  ChannelChat
//
//  Created by Johny Babylon on 2/26/19.
//  Copyright © 2019 Agile Associates. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
        
        
        func setupView() {
            self.layer.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            self.layer.cornerRadius = 10
            self.clipsToBounds = true 
        }
    
}
