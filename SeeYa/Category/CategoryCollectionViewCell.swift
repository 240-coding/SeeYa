//
//  CategoryCollectionViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/02.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateImageView: UIImageView!
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var heartButton: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dateImageView.image = UIImage(systemName: "calendar")
        self.locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        style()
        self.heartButton.addTarget(self, action: #selector(pressHeartButton(sender:)), for: .touchUpInside)
    }
    
    private func style() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    @objc func pressHeartButton(sender: UIButton) {
        self.heartButton.setImage(UIImage(systemName: self.heartButton.isSelected ? "heart" : "heart.fill"), for: .normal)
        self.heartButton.isSelected = !self.heartButton.isSelected

    }
}
