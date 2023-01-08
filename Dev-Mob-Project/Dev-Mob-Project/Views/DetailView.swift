//
//  SwiftUIView.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 1/8/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var schedule: Schedule
    
    init(schedule: Schedule) {
        self.schedule = schedule
    }
    
    var body: some View {
        Text(schedule.fields.location!)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(schedule: Schedule(id: "0", createdTime: Date.now, fields: FieldsSchedule(end: Date.now, start: Date.now, activity: "N/A", type: "N/A", location: "N/A")))
    }
}
