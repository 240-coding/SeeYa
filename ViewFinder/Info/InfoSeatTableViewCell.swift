//
//  InfoSeatTableViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2023/03/12.
//

import UIKit

protocol SeatCellDelegate {
    func didSeatCellTapped()
}

struct SeatInfo {
    let title: String
    let percent: Int
    let like: Int
}

class InfoSeatTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "SeatCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: SeatCellDelegate?
    
    private let cellIdentifier = "seatCollectionCell"
    private let seat: [SeatInfo] = [SeatInfo(title: "고척스카이돔 401구역 D열", percent: 92, like: 23), SeatInfo(title: "고척스카이돔 201구역 F열", percent: 98, like: 31)]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension InfoSeatTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! InfoSeatCollectionViewCell
        
        let seat = self.seat[indexPath.row]
        
        cell.imageView.image = UIImage(named: "img\(indexPath.row)")
        
        cell.titleLabel.text = seat.title
        cell.percentLabel.text = "\(seat.percent)% 만족"
        cell.likeLabel.text = String(seat.like)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSeatCellTapped()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 200)
    }
}
