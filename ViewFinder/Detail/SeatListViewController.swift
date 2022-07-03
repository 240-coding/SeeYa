//
//  SeatListViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

protocol SeatListDelegate {
    func pushVC()
}
class SeatListViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var closeButton: UIButton!
    
    // Data
    let seat = ["1열 1~12석", "2열 1~16석", "4열 1~25석"]
    let score = ["97% 만족 (리뷰 121)", "92% 만족 (리뷰 64)", "91% 만족 (리뷰 81)"]
    let price = ["124,000원", "104,000원", "104,000원"]
    let ticketStatus = [true, false, true]
    
    var delegate: SeatListDelegate?
    
    let cellIdentifier = "seatListCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func pressCloseButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension SeatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SeatListTableViewCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        cell.seatInfoLabel.text = seat[index]
        cell.scoreLabel.text = score[index]
        cell.priceLabel.text = price[index]
        cell.ticketCountLabel.text = ticketStatus[index] ? "티켓 교환(3개)" : "티켓 교환(물량 없음)"
        cell.ticketCountLabel.textColor = ticketStatus[index] ? UIColor(named: "Highlight") : .gray
        cell.ticketCountImageView.tintColor = ticketStatus[index] ? UIColor(named: "Highlight") : .gray
        cell.seatImageView.image = UIImage(named: "seat\(index)")
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        delegate?.pushVC()
    }
    
}
