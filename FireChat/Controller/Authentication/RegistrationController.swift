//
//  RegistrationController.swift
//  FireChat
//
//  Created by Mateus Sales on 18/05/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainerView: InputContainerView = {
        return InputContainerView(textfield: emailTextField, image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"))
    }()
    
    private lazy var fullnameContainerView: InputContainerView = {
        return InputContainerView(textfield: fullnameTextField, image: #imageLiteral(resourceName: "ic_person_outline_white_2x"))
    }()
    
    private lazy var usernameContainerView: InputContainerView = {
        return InputContainerView(textfield: usernameTextField, image: #imageLiteral(resourceName: "ic_person_outline_white_2x"))
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(textfield: passwordTextField, image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"))
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let fullnameTextField = CustomTextField(placeholder: "Fullname")
    private let usernameTextField = CustomTextField(placeholder: "Username")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let singinButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Sign Up", for: .normal)
        bt.layer.cornerRadius = 5
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        bt.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        bt.setTitleColor(.white, for: .normal)
        bt.setHeight(height: 50)
        return bt
    }()
    
    private let alreadyAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let atributtedTitle = NSMutableAttributedString(string: "Have an account? ", attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        atributtedTitle.append(NSAttributedString(string: "Log In", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(atributtedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSingUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoButton.setDimensions(width: 120, height: 120)
        
        view.addSubview(alreadyAccountButton)
        alreadyAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 32, paddingBottom: 16, paddingRight: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, fullnameContainerView, usernameContainerView, passwordContainerView, singinButton])
        
        stack.axis = .vertical
        stack.spacing = 16
        view.addSubview(stack)
        
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        
    }
    
    // MARK: - Selectors
    
    @objc func handleSelectPhoto() {
        
    }
    
    @objc func handleShowSingUp() {
        navigationController?.popViewController(animated: true)
    }
}
