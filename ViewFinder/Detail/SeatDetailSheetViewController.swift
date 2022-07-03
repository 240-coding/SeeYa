//
//  SeatDetailSheetViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class SeatDetailSheetViewController: UIViewController {
    @IBOutlet var seatLabel: UILabel!
    @IBOutlet var zoneLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var scoreImageView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "SeatDetailTableViewCell"
    let cellIdentifier2 = "TicketTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension SeatDetailSheetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.section == 0 ? cellIdentifier : cellIdentifier2, for: indexPath) as? SeatDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 250 : 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
        header.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = section == 0 ? "리뷰(18)" : "티켓교환(3)"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        let detailButton = UIButton()
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        detailButton.setTitle("자세히 보기", for: .normal)
        detailButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        detailButton.titleLabel?.textColor = .systemGray4
        detailButton.tintColor = .systemGray4
        detailButton.semanticContentAttribute = .forceRightToLeft
        header.addSubview(titleLabel)
        header.addSubview(detailButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: header.topAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.leadingAnchor, multiplier: 2),
            detailButton.topAnchor.constraint(equalToSystemSpacingBelow: header.topAnchor, multiplier: 1),
            header.trailingAnchor.constraint(equalToSystemSpacingAfter: detailButton.trailingAnchor, multiplier: 2)
        ])
        
        return header
    }
}
