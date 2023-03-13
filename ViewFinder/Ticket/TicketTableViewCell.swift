//
//  TicketTableViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "TicketCell"
    
    @IBOutlet var oppositeImageView: UIImageView!
    @IBOutlet var oppositeNameView: UIView!
    @IBOutlet var oppositeEventNameLabel: UILabel!
    @IBOutlet var oppositeSeatLabel: UILabel!
    @IBOutlet var oppositeSeatDetailLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myNameView: UIView!
    @IBOutlet var myEventNameLabel: UILabel!
    @IBOutlet var mySeatLabel: UILabel!
    @IBOutlet var mySeatDetailLabel: UILabel!
    @IBOutlet var sendChatButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myNameView.layer.cornerRadius = 17.5
        oppositeNameView.layer.cornerRadius = 17.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
