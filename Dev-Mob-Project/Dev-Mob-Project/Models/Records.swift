//
//  Records.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import Foundation
import UIKit

struct RecordsSchedule: Codable {
    let records: [Schedule]?
}

struct RecordsSpeaker: Codable {
    let records: [Speaker]?
}
