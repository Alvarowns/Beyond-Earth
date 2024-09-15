//
//  SolarSystemBody.swift
//  Beyond Earth
//
//  Created by Alvaro Santos Orellana on 8/9/24.
//

import SwiftUI

struct SolarSystemBodyView: View {
    @EnvironmentObject private var viewModel: SolarSystemVM
    
    let systemBody: SolarSystem.SolarSystemBody
    
    var body: some View {
        VStack {
            Image(.earth)
                .resizable()
                .scaledToFit()
                .frame(width: 800, height: 400)
                .ignoresSafeArea()
            
            Text(systemBody.englishName.capitalized)
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 40) {
                Text("Density")
                
                Text(systemBody.density.description)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                
        }
        .foregroundStyle(.white)
        .background(.black)
    }
}

#Preview {
    SolarSystemBodyView(systemBody: .test)
        .environmentObject(SolarSystemVM())
}
