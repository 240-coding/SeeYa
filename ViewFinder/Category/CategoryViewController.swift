//
//  CategoryViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/02.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "sectionCell"
    
    // TableView Data
    let titles = ["스포츠", "공연", "페스티벌"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveCellSelectedNotification(_:)), name: Notification.Name("DidCellSelected"), object: nil)
    }
    
    @objc func didReceiveCellSelectedNotification(_ noti: Notification) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CategoryTableViewCell
        cell.index = indexPath.row
        cell.titleLabel.text = titles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
