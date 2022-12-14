//
//  SchedulesViewModel.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import Foundation

class SchedulesViewModel : ObservableObject {
    @Published var listSchedule: [Schedule] = []
    
    init() {
        self.loadList()
    }
    
    func loadList(){
        // Controller
        let requestFactory = RequestFactory()
        
        requestFactory.getScheduleList { (errorHandle, schedules) in
            if let _ = errorHandle.errorType, let errorMessage = errorHandle.errorMessage {
                print(errorMessage)
            }
            else if let list = schedules {
                DispatchQueue.main.async {
                    self.listSchedule = [Schedule](list)
                }
            }
            else {
                print("Houston we got a problem")
            }

        }
    }

}
