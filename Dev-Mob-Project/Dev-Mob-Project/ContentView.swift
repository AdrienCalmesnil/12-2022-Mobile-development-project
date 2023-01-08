//
//  ContentView.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var scheduleViewModel: SchedulesViewModel
    @State var selectedItem = ""
    
    var body: some View {
        VStack {
            Picker("Chosse a type of event",selection: $selectedItem) {
                ForEach(scheduleViewModel.typeSchedule, id: \.self)
                { type in
                    Text(type)
                }
            }
            
            List
            {
                ForEach(scheduleViewModel.listSchedule) { l in
                    if(selectedItem != ""){
                        if(selectedItem == l.fields.type!){
                            Text(l.fields.activity!)
                        }
                    }
                    else {
                        Text(l.fields.activity!)
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scheduleViewModel: SchedulesViewModel())
    }
}
