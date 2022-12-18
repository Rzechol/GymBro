//
//  UserModel.swift
//  GymBro
//
//  Created by Bartosz Rzechółka on 17/12/2022.
//

import Foundation

struct UserModel: Codable {
    
    var signUpDate = Date.now
    var userEmail: String
    
}
