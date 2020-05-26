//
//  LoginController.swift
//  FireChat
//
//  Created by Mateus Sales on 18/05/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    
    private let imageIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailContainerView: InputContainerView = {
        return InputContainerView(textfield: emailTextField, image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"))
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(textfield: passwordTextField, image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"))
    }()
    
    private let loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Log In", for: .normal)
        bt.layer.cornerRadius = 5
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        bt.backgroundColor = .systemRed
        bt.setHeight(height: 50)
        return bt
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        view.addSubview(imageIcon)
        
        imageIcon.centerX(inView: view)
        imageIcon.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        imageIcon.setDimensions(width: 120, height: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        
        stack.axis = .vertical
        stack.spacing = 16
        view.addSubview(stack)
        
        stack.anchor(top: imageIcon.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPink.cgColor, UIColor.systemPurple.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
    }
}
