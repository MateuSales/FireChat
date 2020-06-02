//
//  RegistrationViewModel.swift
//  FireChat
//
//  Created by Mateus Sales on 01/06/20.
//  Copyright © 2020 Mateus Sales. All rights reserved.
//

import Foundation

struct RegistrationViewModel: AuthenticationProtocol {
    var email: String?
    var fullname: String?
    var username: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && username?.isEmpty == false && fullname?.isEmpty == false
    }
}
