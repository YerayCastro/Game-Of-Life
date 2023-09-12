//
//  RoundButtonView.swift
//  GameOfLife
//
//  Created by Yery Castro on 6/7/23.
//

import SwiftUI

struct RoundButtonView: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(width: 60)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 1)
            )
    }
}

//struct RoundButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoundButtonView()
//    }
//}
