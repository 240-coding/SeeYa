//
//  SeatDetailCollectionViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    @IBOutlet var seatImageView: UIImageView!
    @IBOutlet var writerView: UIView!
    @IBOutlet var writerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var heartCountLabel: UILabel!
    @IBOutlet var reviewContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        writerView.roundCorners(corners: [.allCorners], radius: 17.5)
        writerView.backgroundColor = .gray
        writerView.layer.cornerRadius = 17.5
        writerView.layer.borderColor = UIColor.white.cgColor
        writerView.layer.borderWidth = 2
        writerView.layer.masksToBounds = false
        writerLabel.textColor = .white
    }
}
