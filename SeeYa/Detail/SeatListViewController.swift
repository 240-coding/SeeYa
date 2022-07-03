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
