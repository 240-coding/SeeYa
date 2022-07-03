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
    
    // Data
    let score = ["92% 만족", "90% 만족"]
    let heart = ["♥ 182", "♥ 81"]
    let content = ["다 좋은데 바로 앞 네트가 조금 신경쓰였습니다. 다음 번엔 그냥 3층으로 올라가야하나 고민이 듭니다...", "앞을 가로막는 구조물이 하나도 없어서 눈 앞에서 야구를 치는 듯한 착각이 듭니다. 최고의 좌석이에요!"]

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
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? ReviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        let index = indexPath.row
        cell.seatImageView.image = UIImage(named: "view\(index)")
        cell.scoreLabel.text = score[index]
        cell.heartCountLabel.text = heart[index]
        cell.writerLabel.text = "익명"
        cell.reviewContentLabel.text = content[index]
        
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
        return CGSize(width: 230, height: 200)
    }
}
