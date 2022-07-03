//
//  TicketViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class TicketViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    let cellIdentifier = "TicketTableViewCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setSearchBar()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func setSearchBar() {
        searchBar.searchTextField.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }

}

extension TicketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TicketTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
