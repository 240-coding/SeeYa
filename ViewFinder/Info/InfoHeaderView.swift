//
//  InfoHeaderView.swift
//  SeeYa
//
//  Created by 이서영 on 2023/03/12.
//

import UIKit

class InfoHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "InfoHeader"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
