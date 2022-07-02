//
//  DetailViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styleNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func styleNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.topItem?.title = ""
//        navigationController?.navigationBar.topItem?.hidesBackButton = true
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.systemGray6.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 1
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationController?.navigationBar.layer.shadowRadius = 2
        
        // 뒤로 가기
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popVC))
//        backButton.image = UIImage(systemName: "chevron.backward")
        backButton.imageInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        navigationItem.leftBarButtonItem = backButton
//        navigationItem.backBarButtonItem = backButton
//        navigationItem.backBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)

        
        // 하트 버튼
        let heartButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(pressHeartButton(sender:)))
        heartButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        navigationItem.rightBarButtonItem = heartButton
        
        // 타이틀
        let title = UILabel()
        title.text = "야구 경기"
        title.font = UIFont.boldSystemFont(ofSize: 17)
        
        let locationImage = UIImageView(image: UIImage(systemName: "calendar"))
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        locationImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        locationImage.tintColor = .gray
        
        let subtitle = UILabel()
        subtitle.text = "2022-07-01"
        subtitle.font = UIFont.systemFont(ofSize: 13)
        subtitle.textColor = .gray
        
        let subtitleStack = UIStackView(arrangedSubviews: [locationImage, subtitle])
        subtitleStack.axis = .horizontal
        subtitleStack.spacing = 4
        
        let titleStack = UIStackView(arrangedSubviews: [title, subtitleStack])
        titleStack.axis = .vertical
        titleStack.spacing = 3

        let spacer = UIView()
        let constraint = spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat.greatestFiniteMagnitude)
        constraint.isActive = true
        constraint.priority = .defaultLow

        let stack = UIStackView(arrangedSubviews: [titleStack, spacer])
        stack.axis = .horizontal

        navigationItem.titleView = stack

    }
    
    @objc func popVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func pressHeartButton(sender: UIBarButtonItem) {
        guard let isLiked = UserInformation.shared.isLiked else {
            return
        }
        UserInformation.shared.isLiked = !isLiked
        sender.image = isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        let newHeartButton = UIBarButtonItem(image: UIImage(systemName: isLiked ? "heart.fill" : "heart"), style: .plain, target: self, action: #selector(pressHeartButton(sender:)))
        newHeartButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        newHeartButton.tintColor = isLiked ? UIColor(named: "Highlight") : .black
        navigationItem.rightBarButtonItem = newHeartButton
        
    }
}
