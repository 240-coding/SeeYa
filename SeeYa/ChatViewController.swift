//
//  ChatViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet var topView: UIView!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var greenView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        setTopView()
    }
    
    func setTopView() {
        topView.layer.masksToBounds = false
        topView.layer.shadowRadius = 4
        topView.layer.shadowOpacity = 1
        topView.layer.shadowColor = UIColor.systemGray5.cgColor
        topView.layer.shadowOffset = CGSize(width: 0 , height:4)
        greenView.clipsToBounds = true
        greenView.layer.cornerRadius = 7.5
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.clear.cgColor
        // 뷰의 경계에 맞춰준다
        profileImageView.clipsToBounds = true
        
        backButton.addTarget(self, action: #selector(popVC), for: .touchUpInside)
    }
    
    @objc func popVC() {
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
