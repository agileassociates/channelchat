//
//  MessageCell.swift
//  ChannelChat
//
//  Created by Johny Babylon on 3/28/19.
//  Copyright © 2019 Agile Associates. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
   
    @IBOutlet weak var userImage: CircleImage!
    
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message) {
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
    }
}
