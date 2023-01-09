//
//  DetailViewModel.swift
//  Dev-Mob-Project
//
//  Created by user232673 on 1/9/23.
//

import Foundation

class DetailViewModel : ObservableObject {
    @Published var listSpeaker : [Speaker] = []
    
    init() {
    }
    
    init(schedule: Schedule) {
        loadSpeakers(schedule: schedule)
    }
    
    func loadSpeakers(schedule: Schedule){
        let requestFactory = RequestFactory()
        
        requestFactory.getSpeakerList { (errorHandle, speakers) in
            if let _ = errorHandle.errorType, let errorMessage = errorHandle.errorMessage {
                print(errorMessage)
            }
            else if var list = speakers {
                DispatchQueue.main.async {
                    
                    if let speakerIds = schedule.fields.speakers {
                        list = list.filter {
                            speakerIds.contains($0.id)
                        }
                        self.listSpeaker = [Speaker](list)
                    }
                }
            }
            else {
                print("Houston we got a problem")
            }
            
        }
    }
}
