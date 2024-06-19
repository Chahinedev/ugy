//
//  background.swift
//  ugy
//
//  Created by Chahine Ouasti on 19/06/2024.
//

import Foundation
import SwiftUI

struct Background: View {
    @State private var width: CGFloat = 0
    @State private var height: CGFloat = 0
    let geometry:GeometryProxy
    init(geometry: GeometryProxy) {
        self.geometry = geometry
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://img.freepik.com/photos-gratuite/fleurs-cerisier-au-printemps-pagode-chureito-montagne-fuji-au-coucher-du-soleil-au-japon_335224-215.jpg")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            } placeholder: {
                Color.gray
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            }
        }.frame(height: geometry.size.height)
    }
}

#Preview {
    ContentView()
}
