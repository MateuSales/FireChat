//
//  LoginViewModel.swift
//  FireChat
//
//  Created by Mateus Sales on 01/06/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
