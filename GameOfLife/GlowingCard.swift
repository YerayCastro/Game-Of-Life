//
//  GlowingCard.swift
//  GameOfLife
//
//  Created by Yery Castro on 6/7/23.
//

import SwiftUI

struct GlowingCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 500, alignment: .center)
            .background(
                LinearGradient(colors: [.blue, .green],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .glow(color: .black, radius: 5)
            .glow(color: .purple, radius: 15)
    }
}

extension View {
    func glow( color: Color, radius: CGFloat) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
