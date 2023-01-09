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
        VStack(alignment: .leading){
            Text(schedule.fields.activity!).bold().font(.largeTitle).padding(.bottom)
            Text("Located at the " + schedule.fields.location!)
            
            HStack{
                Text("From")
                Text((schedule.fields.start!), style: .date)
                Text((schedule.fields.start!), style: .time)
                Text("to")
                Text((schedule.fields.end!), style: .time)
            }
            VStack(alignment: .leading){
                Text("Speakers").bold()
                Text("Speaker 1 " + "Speaker 2")
            }.padding(.top).padding(.bottom)
            
            
            Text("Notes").bold()
            Text(schedule.fields.notes!)
            Spacer()
        }.frame(maxWidth: .infinity).background(Color.orange)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(schedule: Schedule(id: "0", createdTime: Date.now, fields: FieldsSchedule(end: Date.now, start: Date.now, activity: "N/A", type: "N/A", notes:"N/A", location: "N/A")))
    }
}
