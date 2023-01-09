//
//  Schedule.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import Foundation
import UIKit

class Schedule: Codable, Identifiable, ObservableObject {
    let id: String
    let createdTime: Date?
    let fields: FieldsSchedule
    
    init(id: String, createdTime: Date?, fields: FieldsSchedule){
        self.id = id
        self.createdTime = createdTime
        self.fields = fields
    }
}

struct FieldsSchedule: Codable {
    let end: Date?
    let start: Date?
    let activity: String?
    let type: String?
    let speakers: [String?]?
    let notes: String?
    let location: String?
    enum CodingKeys: String, CodingKey {
        case end = "End"
        case start = "Start"
        case activity = "Activity"
        case type = "Type"
        case speakers = "Speaker(s)"
        case notes = "Notes"
        case location = "Location"
    }
}
