//
//  SwiftUIView.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 1/8/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var schedule: Schedule
    @ObservedObject var detailViewModel: DetailViewModel
    
    init(schedule: Schedule) {
        self.schedule = schedule
        self.detailViewModel = DetailViewModel(schedule: schedule)
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
            }.padding(.bottom)
            
            if (detailViewModel.listSpeaker.count > 0){
                VStack(alignment: .leading){
                    Text("Speakers").bold()
                    ForEach(detailViewModel.listSpeaker, id: \.id){ e in
                        Text(e.fields.name!)
                    }
                }.padding(.bottom)
            }
            
            if((schedule.fields.notes) != nil){
                Text("Notes").bold()
                Text(schedule.fields.notes!)
            }
            Spacer()
        }.frame(maxWidth: .infinity).background(Color.orange)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(schedule: Schedule(id: "0", createdTime: Date.now, fields: FieldsSchedule(end: Date.now, start: Date.now, activity: "N/A", type: "N/A", speakers:nil, notes:"N/A", location: "N/A")))
    }
                    
}
