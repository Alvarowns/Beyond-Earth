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
    
    var events: EONETModel = EONETModel(title: "", description: "", link: "", events: [])
    
    init() {
        Task {
            await getEonetEvents()
        }
    }
    
    func getEonetEvents() async {
        do {
            let events = try await network.getEonetEvents()
            await MainActor.run {
                self.events = events
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
