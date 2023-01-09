//
//  SchedulesViewModel.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 12/12/22.
//

import Foundation

class SchedulesViewModel : ObservableObject {
    @Published var listSchedule: [Schedule] = []
    @Published var typeSchedule: [String] = []
    @Published var dateSchedule: [String] = []
    
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
                    
                    self.listSchedule.sort{ (x: Schedule, y: Schedule) -> Bool in
                        return x.fields.start! < y.fields.start!
                    }
                    
                    self.loadType()
                    self.loadDate()
                }
            }
            else {
                print("Houston we got a problem")
            }
            
        }
    }

    func loadType(){
        var setTypeSchedule: Set<String> = ["All"]
        for e in self.listSchedule {
            setTypeSchedule.insert(e.fields.type!)
        }
        self.typeSchedule = Array(setTypeSchedule)
        
        self.typeSchedule.sort { (x: String, y: String) -> Bool in
            return x < y
        }
    }
    func loadDate(){
        var setDateSchedule: Set<String> = ["All"]
        for e in self.listSchedule {
            setDateSchedule.insert(e.fields.start!.formatted(date: .numeric, time: .omitted))
        }
        self.dateSchedule = Array(setDateSchedule)
        
        self.dateSchedule.sort { (x: String, y: String) -> Bool in
            return x < y
        }
    }
}
