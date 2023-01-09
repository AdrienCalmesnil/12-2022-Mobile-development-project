//
//  ContentView.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var scheduleViewModel: SchedulesViewModel
    @State var selectedItem = "All"
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Welcome to the Technologic congress !").bold().font(.title).multilineTextAlignment(.center)
                HStack{
                    Text("Chose a type of event :")
                    Picker("Chose a type of event",selection: $selectedItem) {
                        ForEach(scheduleViewModel.typeSchedule, id: \.self)
                        { type in
                            Text(type)
                        }
                    }.background(.white)
                }
                List
                {
                    ForEach(scheduleViewModel.listSchedule) { l in
                        
                        if(selectedItem == "All" || selectedItem == l.fields.type){
                            NavigationLink(destination: DetailView(schedule: l)){
                                HStack(alignment: .lastTextBaseline){
                                    Text(l.fields.activity!).padding()
                                    Spacer()
                                    Text((l.fields.start!), style : .time)
                                }
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.orange)
            
            }
            .background(Color.orange)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scheduleViewModel: SchedulesViewModel())
    }
}
