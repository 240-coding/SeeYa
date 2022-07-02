//
//  UserInformation.swift
//  SeeYa
//
//  Created by 이서영 on 2022/07/03.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var selectedPlace: String?
    var isLiked: Bool?
}
