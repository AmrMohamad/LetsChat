//
//  ConversationCell.swift
//  LetsChat
//
//  Created by Amr Mohamad on 10/27/20.
//  Copyright © 2020 Amr Mohamad. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {
    @IBOutlet weak var imgOfChat: UIImageView!
    @IBOutlet weak var nameOfRecipient: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
