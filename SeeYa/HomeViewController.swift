//
//  HomeViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/02.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {
    
    @IBOutlet var topMenuView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    
    private var viewControllers = [UIViewController(), UIViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        style()
                
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: topMenuView, layout: nil))
        
        // Bar Style
//        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: 90)

        
        bar.backgroundView.style = .blur(style: .light)
        bar.indicator.tintColor = UIColor(named: "Highlight")
        bar.buttons.customize { (button) in
            button.tintColor = .black
            button.selectedTintColor = UIColor(named: "Highlight")
        }
    }
    
    private func style() {
        searchBar.searchTextField.font = UIFont.preferredFont(forTextStyle: .subheadline)
    }

}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "카테고리순")
        case 1:
            return TMBarItem(title: "거리순")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
        
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    
}
