//
//  ViewController.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/02.
//

import UIKit

class LoginViewController: UIViewController {

    // Components
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var blurView: UIView!
    @IBOutlet var signinStackView: UIStackView!
    @IBOutlet var signinLabel: UILabel!
    @IBOutlet var signinBottomLine: UIView!
    @IBOutlet var loginStackView: UIStackView!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var loginBottomLine: UIView!
    
    // TextField
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var signinButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    var isSigninSelected = true
    var isLoginSelected = false
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundImageView()
        setBlurView()
        setMenuStack()
        setTextField()
        setButtons()

    }
    
    func setBackgroundImageView() {
        backgroundImageView.image = UIImage(named: "LoginBg")
    }
    
    func setBlurView() {
        blurView.backgroundColor = .clear
        blurView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    
    func setMenuStack() {
        signinStackView.isUserInteractionEnabled = true
        loginStackView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(pressStackView(sender:)))
        signinStackView.addGestureRecognizer(tap)
        loginStackView.addGestureRecognizer(tap)
        setStackViewComponentsColor()
    }
    
    func setTextField() {
        nameTextField.styleTextField()
        idTextField.styleTextField()
        passwordTextField.styleTextField()
    }
    
    func setButtons() {
        signinButton.isHidden = isSigninSelected ? false : true
        loginButton.isHidden = isLoginSelected ? false : true
    }
}

extension LoginViewController {
    @objc func pressStackView(sender: UIStackView) {
        isSigninSelected = !isSigninSelected
        isLoginSelected = !isLoginSelected
        print(isSigninSelected)
        print(isLoginSelected)

        setStackViewComponentsColor()
        initTextFields()
        setButtons()
        
    }
    
    func setStackViewComponentsColor() {
        signinLabel.textColor = isSigninSelected ? .white : .systemGray5
        signinBottomLine.isHidden = isSigninSelected ? false : true
        
        loginLabel.textColor = isLoginSelected ? .white : .systemGray5
        loginBottomLine.isHidden = isLoginSelected ? false : true
    }
    
    func initTextFields() {
        if isLoginSelected {
            nameTextField.isHidden = true
        } else {
            nameTextField.isHidden = false
        }
        nameTextField.text = ""
        idTextField.text = ""
        passwordTextField.text = ""
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension UITextField {
    func styleTextField() {
        self.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer((border))
        self.textColor = UIColor.white
    }
}
