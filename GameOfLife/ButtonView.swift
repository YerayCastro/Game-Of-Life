//
//  ButtonView.swift
//  GameOfLife
//
//  Created by Yery Castro on 6/7/23.
//

import SwiftUI

struct ButtonView: View {
    let name: String
    var font: Font = Font.largeTitle
    var action: () -> Void
    var color: Color = Color.white
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: name)
                .font( font)
                .foregroundColor(color)
        })
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            bgColor
                .opacity(0.8)
                .ignoresSafeArea()
            HStack(spacing: 15) {
                ButtonView(name: "play", action: {
                    print("Play")
                }, color: .red)
                ButtonView(name: "bolt", action: {
                    print("Play")
                }, color: .blue)
                ButtonView(name: "lasso", action: {
                    print("Play")
                })
            }
        }
    }
}
