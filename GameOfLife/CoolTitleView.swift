//
//  CoolTitleView.swift
//  GameOfLife
//
//  Created by Yery Castro on 5/7/23.
//

import SwiftUI

struct CoolTitleView: View {
    let gradientColors: [Color] = [.white, .pink, .red]
    
    var body: some View {
        LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .trailing)
            .frame(height: 50)
            .mask(Text("Game Of Life").font(.largeTitle).fontWeight(.bold)).padding()
    }
}

struct CoolTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CoolTitleView()
    }
}
