//
//  Badge.swift
//  Landmarks
//
//  Created by Daniil Vilchinskiy on 07.01.2023.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View{
        ForEach(0..<8){ index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack{
            BadgeBackgroung()
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
