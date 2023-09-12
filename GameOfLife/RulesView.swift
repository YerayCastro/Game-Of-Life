//
//  RulesView.swift
//  GameOfLife
//
//  Created by Yery Castro on 6/7/23.
//

import SwiftUI

struct RulesView: View {
    @Binding var surviveRules: [Bool]
    @Binding var bornRules: [Bool]
    @Binding var rulesShowing: Bool
    @Binding var disableAllButtons: Bool
    
    var defaultSurviveRules: [Bool]
    var defaultBornRules: [Bool]
    let count: Int = 9
    let CARD_ROTATE_DURATION = 0.2
    
    @State private var done: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Label(title: {
                Text("Rules")
                    .font(.title)
                    .fontWeight(.bold)
            }, icon: {
                Image(systemName: "text.book.closed")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
            })
            .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                RulesCheckboxView(name: "Survive", rules: $surviveRules)
                
                
                RulesCheckboxView(name: "Born", rules: $bornRules)
                
                Spacer()
                
                HStack {
                    // Return to default values
                    Button(action: {
                        surviveRules = defaultSurviveRules
                        bornRules = defaultBornRules
                    }, label: {
                        Text("Default")
                            .font(.headline)
                    })
                    .buttonStyle(RoundButtonView())
                    Spacer()
                    Button(action: {
                        withAnimation(.linear(duration: CARD_ROTATE_DURATION)) {
                            done = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + CARD_ROTATE_DURATION) {
                            rulesShowing.toggle()
                            disableAllButtons = false
                        }
                    }, label: {
                        Text("Ok")
                    })
                    .buttonStyle(RoundButtonView())
                }
                .padding()
            }
            .padding()
        }
        .modifier(GlowingCard())
        
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView(surviveRules: .constant([
            false, false, true, true, false, false,
            false,false,false
            ]),
                  bornRules: .constant([
                    false, false, false, true, false, false,
                    false,false,false
                    ]),
                  rulesShowing: .constant(true),
                  disableAllButtons: .constant(true),
                  defaultSurviveRules: [
                    false, false, true, true, false, false,
                    false,false,false
                    ],
                  defaultBornRules: [
                    false, false, false, true, false, false,
                    false,false,false
                    ])
    }
}
