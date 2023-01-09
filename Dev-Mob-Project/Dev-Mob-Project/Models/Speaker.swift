//
//  Speaker.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 1/8/23.
//

import Foundation
import UIKit

struct Speaker: Codable, Identifiable {
    let id: String
    let fields: FieldsSpeaker
}

struct FieldsSpeaker: Codable {
    let name: String?
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}
