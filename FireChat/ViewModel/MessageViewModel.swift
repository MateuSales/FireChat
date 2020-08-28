//
//  MessageViewModel.swift
//  FireChat
//
//  Created by Mateus Sales on 28/08/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import UIKit

struct MessageViewModel {
    private let message: Message
    
    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? .lightGray : .systemPurple
    }
    
    var messageTextColor: UIColor {
        return message.isFromCurrentUser ? .black : .white
    }
    
    init(message: Message) {
        self.message = message
    }
}
