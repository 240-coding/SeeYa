//
//  SeatListTableViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class SeatListTableViewCell: UITableViewCell {
    
    @IBOutlet var seatImageView: UIImageView!
    @IBOutlet var seatInfoLabel: UILabel!
    @IBOutlet var scoreImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var ticketCountImageView: UIImageView!
    @IBOutlet var ticketCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
