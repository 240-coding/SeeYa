//
//  InfoLinkTableViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2023/03/13.
//

import UIKit

class InfoLinkTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "LinkCell"
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var interparkImageView: UIImageView!
    @IBOutlet var yes24ImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        interparkImageView.layer.borderColor = UIColor(named: "Gray")?.cgColor
//        interparkImageView.layer.borderWidth = 1
//        stackView.layer.borderColor = UIColor(named: "Gray")?.cgColor
//        stackView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
