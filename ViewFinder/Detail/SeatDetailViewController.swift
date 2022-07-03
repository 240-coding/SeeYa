//
//  SeatDetailViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class SeatDetailViewController: UIViewController {

    @IBOutlet var backButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        backButton.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
        presentSeatDetailSheetVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true

    }
    
    func presentSeatDetailSheetVC() {
        guard let seatDetailSheetVC = storyboard?.instantiateViewController(withIdentifier: "SeatDetailSheetViewController") as? SeatDetailSheetViewController else {
            print("Can't find VC")
            return
        }
        let nav = UINavigationController(rootViewController: seatDetailSheetVC)
        // 1
        nav.modalPresentationStyle = .pageSheet
//        nav.isModalInPresentation = true
        // 2
        if let sheet = nav.sheetPresentationController {
            // 3
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 15
        }
        // 4
        present(nav, animated: true, completion: nil)
    }
    
    @objc func pressBackButton() {
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
