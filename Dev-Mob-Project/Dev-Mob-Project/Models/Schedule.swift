//
//  Schedule.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import Foundation
import UIKit

struct Schedule: Codable {
    let id: String
    //let createdTime: MTLTimestamp?
    let fields: Fields
}

struct Fields: Codable {
    //let end: MTLTimestamp?
    //let start: MTLTimestamp?
    let activity: String?
    let type: String?
    //let speakers: [String?]
    let location: String?
    enum CodingKeys: String, CodingKey {
        //case end = "End"
        //case start = "Start"
        case activity = "Activity"
        case type = "Type"
        //case speakers = "Speaker(s)"
        case location = "Location"
    }
}
