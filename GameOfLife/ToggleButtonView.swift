//
//  ToggleButtonView.swift
//  GameOfLife
//
//  Created by Yery Castro on 6/7/23.
//

import SwiftUI

struct ToggleButtonView: View {
    @Binding var isActive: Bool
    var enabledName: String = "checkmark.square"
    var disabledName: String = "square.fill"
    var font = Font.subheadline
    var color = Color.white
    let action: () -> Void
    var activeScale: Double = 1.0
    var inactiveScale: Double = 1.0
    
    var body: some View {
        Button(action: {
            isActive.toggle()
            action()
        }, label: {
            Image(systemName: isActive ? enabledName : disabledName)
                .font(font)
                .foregroundColor(color)
        })
        .scaleEffect(isActive ? activeScale : inactiveScale)
        .animation(.linear(duration: 0.5), value: 1)
    }
}

struct ToggleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            HStack {
                ToggleButtonView(isActive: .constant(true),
                                 action: {})
                ToggleButtonView(isActive: .constant(false),
                                 action: {})
            }
        }
    }
}
