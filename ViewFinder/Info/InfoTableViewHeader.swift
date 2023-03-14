//
//  InfoTableViewHeader.swift
//  SeeYa
//
//  Created by 이서영 on 2023/03/14.
//

import UIKit

class InfoTableViewHeader: UITableViewHeaderFooterView {
    
    static let identifier = "tableViewHeader"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var sectionHeaderView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let shadows = UIView()
        shadows.frame = imageView.frame
        shadows.clipsToBounds = false
        imageView.addSubview(shadows)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 0)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 30
        layer0.shadowOffset = CGSize(width: 3, height: 5)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        
        sectionHeaderView.clipsToBounds = true
        sectionHeaderView.layer.cornerRadius = 16
        sectionHeaderView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }

}
