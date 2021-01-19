//
//  RandomUserModel.swift
//  RandomUsersRedo
//
//  Created by BrysonSaclausa on 9/18/20.
//  Copyright © 2020 B. All rights reserved.
//

import UIKit

struct UserResults: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable {
    enum RandomUserTopLevelCodingKeys: String, CodingKey {
        case name
        case email
        case phone
        case picture

        enum NameKeys: String, CodingKey {
            case title
            case first
            case last

        }

        enum PictureKeys: String, CodingKey {
            case large
            case medium
            case thumbnail
        }

    }
    var first: String
    var last: String
    var phone: String
    var email: String
    var thumbnail: String
    var medium: String
    
    init(first: String, last: String, phone: String, email: String, thumbnail: String, medium: String) {
        self.first = first
        self.last = last
        self.phone = phone
        self.email = email
        self.thumbnail = thumbnail
        self.medium = medium
    }
    
    init(from decoder: Decoder) throws {
        //go to the JSON an look for these keys
        let container  = try decoder.container(keyedBy: RandomUserTopLevelCodingKeys.self)

        phone = try container.decode(String.self, forKey: .phone)
        email = try container.decode(String.self, forKey: .email)

        let nameContainer = try container.nestedContainer(keyedBy: RandomUserTopLevelCodingKeys.NameKeys.self, forKey: .name)
        first = try nameContainer.decode(String.self, forKey: .first)
        last = try nameContainer.decode(String.self, forKey: .last)
        
        let pictureContainer = try container.nestedContainer(keyedBy: RandomUserTopLevelCodingKeys.PictureKeys.self, forKey: .picture)
        thumbnail = try pictureContainer.decode(String.self, forKey: .thumbnail)
        medium = try pictureContainer.decode(String.self, forKey: .medium)
        
        //let info = RandomUser(first: first, last: last, phone: phone, email: email, thumbnail: thumbnail, medium: medium)
        

     }
}

//let randomUsersURL = URL(string: "https://randomuser.me/api/?format=json&inc=name,email,phone,picture&results=1000")
//let data = try Data(contentsOf: randomUsersURL!)
//let decoder = JSONDecoder()
//let randomUserFetchedData = try decoder.decode(RandomUser.self, from: data)

