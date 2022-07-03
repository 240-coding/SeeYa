//
//  SeatDetailTableViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class SeatDetailTableViewCell: UITableViewCell {
    @IBOutlet var collectionView: UICollectionView!
    let cellIdentifier = "ReviewCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.collectionView.collectionViewLayout = layout
    }

}

extension SeatDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReviewCollectionViewCell {
//            UserInformation.shared.selectedPlace = cell.locationLabel.text
//            NotificationCenter.default.post(name: Notification.Name("DidCellSelected"), object: nil)
        }
    }
}

extension SeatDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 170)
    }
}
