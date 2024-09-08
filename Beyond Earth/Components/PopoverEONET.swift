//
//  PopoverEONET.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 8/9/24.
//

import SwiftUI

struct PopoverEONET: View {
    var body: some View {
        VStack {
            Text("Depending on the number of events this page may take longer than expected to load")
                .font(.headline)
            
            ProgressView()
                .scaleEffect(1.5)
                .padding(10)
            
            Text("In a few seconds you will see every marker!")
                .font(.footnote)
        }
        .multilineTextAlignment(.center)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .shadow(radius: 2)
        }
        .padding()
    }
}
