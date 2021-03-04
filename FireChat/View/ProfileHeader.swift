//
//  ProfileView.swift
//  FireChat
//
//  Created by Mateus Sales on 09/11/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import UIKit

class ProfileHeader: UIView {
    // MARK: - Properties
    
    private let dismissButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(systemName: "xmark"), for: .normal)
        bt.addTarget(self, action: #selector(handleDismiss), for: .touchUpOutside)
        bt.tintColor = .white
        bt.imageView?.setDimensions(width: 22, height: 22)
        return bt
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        configureGrandientLayer()
        backgroundColor = .systemPink
        addSubview(dismissButton)
        
        dismissButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 30, paddingLeft: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureGrandientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        self.layer.addSublayer(gradient)
        gradient.frame = bounds
    }
    
    // MARK: - Selectors
    
    @objc func handleDismiss() {
        print("Dismiss")
    }
}
