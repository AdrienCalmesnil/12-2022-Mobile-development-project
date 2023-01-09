//
//  ContentView.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var scheduleViewModel: SchedulesViewModel
    
    var body: some View {
        VStack {
            List
            {
                ForEach(scheduleViewModel.listSchedule) { l in
                    Text(l.fields.activity!)
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
