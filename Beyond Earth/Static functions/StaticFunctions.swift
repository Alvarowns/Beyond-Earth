//
//  StaticFunctions.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 8/9/24.
//

import SwiftUI

class StaticFunctions: ObservableObject {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
