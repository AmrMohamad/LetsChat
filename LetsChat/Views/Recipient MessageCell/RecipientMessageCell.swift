//
//  RecipientMessageCell.swift
//  LetsChat
//
//  Created by Amr Mohamad on 10/24/20.
//  Copyright © 2020 Amr Mohamad. All rights reserved.
//

import UIKit

class RecipientMessageCell: UITableViewCell {

    @IBOutlet weak var messageShape: UIView!
    @IBOutlet weak var messageBody: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        messageShape.layer.cornerRadius = messageShape.frame.size.height / 6
        //messageShape.layer.shadowColor = CGColor.init(srgbRed: 0.980, green: 0.965, blue: 0.996, alpha: 1.0)
        messageShape.layer.shadowColor = CGColor.init(srgbRed: 0.478, green: 0.255, blue: 0.718, alpha: 1.0)
        messageShape.layer.shadowOpacity = 0.55
        messageShape.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        messageShape.layer.shadowRadius = CGFloat(5.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
