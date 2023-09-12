//
//  RulesCheckboxView.swift
//  GameOfLife
//
//  Created by Yery Castro on 6/7/23.
//

import SwiftUI

struct RulesCheckboxView: View {
    let name: String
    @Binding var rules: [Bool]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(name)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack {
                ForEach(0..<9) { index in
                    VStack(spacing: 3) {
                        ToggleButtonView(isActive: $rules[index],
                                         action: {},
                                         activeScale: 1.5)
                        
                        Text("\(index)")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

struct RulesCheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.purple
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                RulesCheckboxView(name: "Survive", rules: .constant([
                    false, false, true, true, false, false,
                    false,false,false
                ]))
            }
        }
    }
}
