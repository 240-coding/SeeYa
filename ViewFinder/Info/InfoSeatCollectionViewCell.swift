//
//  InfoSeatCollectionViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2023/03/12.
//

import UIKit

class InfoSeatCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 8
    }
}
