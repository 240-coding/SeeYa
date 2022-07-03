//
//  CategoryTableViewCell.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/02.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    let cellIdentifier = "eventCell"
    var index: Int?
    
    // CollectionViewCell Data
    // 스포츠
    let sportsTitle = ["2022 프로야구 KBO 연습전", "2022 신한은행 SOL KBO 리그", "2022 프로야구 KBO 연습전"]
    let sportsDate = ["2022-06-28(일) 13:00", "2022-07-03(금) 13:00", "2022-06-28(일) 13:00"]
    let sportsLocation = ["잠실종합운동장 보조경기장", "고척스카이돔", "잠실종합운동장 보조경기장"]
    // 공연
    let concertTitle = ["세븐틴 “BE THE SUN”", "NCT127 NEO CITY - the link", "세븐틴 “BE THE SUN”"]
    let concertDate = ["2022-06-25~27", "2022-06-17~19", "2022-06-25~27"]
    let concertLocation = ["고척스카이돔", "고척스카이돔", "잠실실내체육관"]

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

extension CategoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let section = self.index
        let index = indexPath.row
        switch section {
        case 0:
            cell.titleLabel.text = sportsTitle[index]
            cell.dateLabel.text = sportsDate[index]
            cell.locationLabel.text = sportsLocation[index]
            cell.backgroundImageView.image = UIImage(named: "sports\(index)")
        case 1:
            cell.titleLabel.text = concertTitle[index]
            cell.dateLabel.text = concertDate[index]
            cell.locationLabel.text = concertLocation[index]
            cell.backgroundImageView.image = UIImage(named: "concert\(index)")
        default:
            cell.titleLabel.text = concertTitle[index]
            cell.dateLabel.text = concertDate[index]
            cell.locationLabel.text = concertLocation[index]
            cell.backgroundImageView.image = UIImage(named: "festival\(index)")
        }

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            UserInformation.shared.selectedPlace = cell.locationLabel.text
            NotificationCenter.default.post(name: Notification.Name("DidCellSelected"), object: nil)
        }
    }
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 230)
    }
}
