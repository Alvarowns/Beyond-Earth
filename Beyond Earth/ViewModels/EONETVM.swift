//
//  EONETVM.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 7/9/24.
//

import Foundation

@Observable
class EONETVM: ObservableObject {
    let network = Network()
    var errorMsg: String = ""
    var showAlert: Bool = false
    
    var isLoading: Bool = false
    
    var events: EONETModel = EONETModel(title: "", description: "", link: "", events: [])
    
    func getEonetEvents() async {
        isLoading = true
        
        do {
            let events = try await network.getEonetEvents()
            await MainActor.run {
                self.events = events
                isLoading = false
            }
        } catch {
                await MainActor.run {
                    self.errorMsg = "\(error)"
                    self.showAlert.toggle()
                    print(errorMsg)
                }
        }
    }
}
