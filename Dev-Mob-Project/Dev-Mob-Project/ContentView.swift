//
//  ContentView.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var scheduleViewModel: SchedulesViewModel
    
    var body: some View {
        VStack {
            List {
                
                List(scheduleViewModel.listSchedule, id: \.id)
                { l in
                    Text(l.fields.activity!)
                }
                 
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(scheduleViewModel: SchedulesViewModel())
    }
}
