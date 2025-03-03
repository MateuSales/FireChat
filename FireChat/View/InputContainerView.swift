//
//  InputContainerView.swift
//  FireChat
//
//  Created by Mateus Sales on 25/05/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import UIKit

class InputContainerView: UIView {
    init(textfield: UITextField, image: UIImage?) {
        super.init(frame: .zero)
        
        setHeight(height: 50)
        
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = .white
        iv.alpha = 0.87
        
        addSubview(iv)
        iv.anchor(left: leftAnchor, paddingLeft: 8)
        iv.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iv.setDimensions(width: 24, height: 24)
        
        addSubview(textfield)
        textfield.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textfield.anchor(left: iv.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 8, height: 0.75)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
