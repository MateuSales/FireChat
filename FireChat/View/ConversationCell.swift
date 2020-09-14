//
//  ConversationCell.swift
//  FireChat
//
//  Created by Mateus Sales on 14/09/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {
    
    // MARK: - Properties
    
    var conversation: Conversation? {
        didSet {
            configure()
        }
    }
    
    let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let timestampLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 12)
        lb.textColor = .darkGray
        lb.text = "2h"
        return lb
    }()
    
    let usernameLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.boldSystemFont(ofSize: 14)
        return lb
    }()
    
    let messageTextLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 14)
        return lb
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImage)
        profileImage.anchor(left: leftAnchor, paddingLeft: 12)
        profileImage.setDimensions(width: 50, height: 50)
        profileImage.layer.cornerRadius = 50 / 2
        profileImage.centerY(inView: self)
        
        let stack = UIStackView(arrangedSubviews: [usernameLabel, messageTextLabel])
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerY(inView: profileImage)
        stack.anchor(left: profileImage.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 16)
        
        addSubview(timestampLabel)
        timestampLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 12)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        usernameLabel.text = conversation?.user.username
        messageTextLabel.text = conversation?.message.text
    }
}
