//
//  DetailViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var scoreView: UIView!
    @IBOutlet var stadiumImageView: UIImageView!
    @IBOutlet var detailShowButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        styleNavigationBar()
        view.backgroundColor = .systemGray6
        setStatusBar()
        setScoreView()
        
        tabBarController?.tabBar.isHidden = true
        
        detailShowButton.addTarget(self, action: #selector(presentSeatListVC), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentSeatListVC))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        styleNavigationBar()
    }
    
    // MARK: - Setup Navigation Bar
    func styleNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.systemGray4.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.5
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 8)
        navigationController?.navigationBar.layer.shadowRadius = 3
        
        // 뒤로 가기
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popVC))
        backButton.imageInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        navigationItem.leftBarButtonItem = backButton

        // 하트 버튼
        let heartButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(pressHeartButton(sender:)))
        heartButton.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        navigationItem.rightBarButtonItem = heartButton
        
        // 타이틀
        let title = UILabel()
        title.text = "2022 프로야구 KBO 연습전"
        title.font = UIFont.boldSystemFont(ofSize: 17)
        
        let locationImage = UIImageView(image: UIImage(systemName: "calendar"))
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        locationImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        locationImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        locationImage.tintColor = .gray
        
        let subtitle = UILabel()
        subtitle.text = "2022-06-28(일) 13:00"
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
    // MARK: - Navigation Bar 끝
    
    func setScoreView() {
        scoreView.roundCorners(corners: [.topLeft, .topRight], radius: 15)
    }
    
    @objc func presentSeatListVC() {
        guard let seatListVC = storyboard?.instantiateViewController(withIdentifier: "SeatListViewController") as? SeatListViewController else {
            print("Can't find VC")
            return
        }
        seatListVC.delegate = self
        let nav = UINavigationController(rootViewController: seatListVC)
        // 1
        nav.modalPresentationStyle = .pageSheet
        // 2
        if let sheet = nav.sheetPresentationController {
            // 3
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 15
        }
        // 4
        present(nav, animated: true, completion: nil)
    }
}

// MARK: - Extension
extension DetailViewController: SeatListDelegate {
    func pushVC() {
        guard let seatDetailVC = storyboard?.instantiateViewController(withIdentifier: "SeatDetailViewController") else {
            print("Can't find VC")
            return
        }
        navigationController?.pushViewController(seatDetailVC, animated: true)
    }
}
extension UIViewController {
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size // deprecated but OK
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)
        
        statusbarView.backgroundColor = .white
        view.addSubview(statusbarView)
    }
}
