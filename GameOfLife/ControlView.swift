//
//  ControlView.swift
//  GameOfLife
//
//  Created by Yery Castro on 6/7/23.
//

import SwiftUI

struct ControlView: View {
    @Binding var isPlaying: Bool
    @Binding var isGridShowing: Bool
    @Binding var rulesShowing: Bool
    @Binding var infoShowing: Bool
    @Binding var speed: Double
    @Binding var board: BoardModel
    @Binding var disableAllButtons: Bool
    
    
    let MAX_SPEED: Double = 10.0

    var body: some View {
        VStack {
            Slider(value: $speed, in: 0...MAX_SPEED)
                .accentColor(.red)
                .padding(.horizontal)
            HStack(spacing: 15) {
                // Play/ Pause Buttons
                ButtonView(name: isPlaying ? "play" : "pause", action: {
                    isPlaying.toggle()
                })
                
                // Refresh Button
                ButtonView(name: "arrow.counterclockwise", action: {
                    board.randomBoard()
                })
                
                // Clear Button
                ButtonView(name: "clear", action: {
                    board.ClearBoard()
                })
                
                // Toggle Grid
                ButtonView(name: "grid", action: {
                    isGridShowing.toggle()
                    
                })
                
                // Rules Button
                ButtonView(name: "text.book.closed", action: {
                    rulesShowing.toggle()
                    disableAllButtons.toggle()
                })
                
                // Info Button
                ButtonView(name: "info.circle", action: {
                    infoShowing.toggle()
                })
            }
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            bgColor
                .opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                ControlView(isPlaying: .constant(true),
                            isGridShowing: .constant(false),
                            rulesShowing: .constant(false),
                            infoShowing: .constant(false),
                            speed: .constant(1.0),
                            board: .constant(BoardModel.defaultBoard(numRows: 25, numCols: 25)), disableAllButtons: .constant(true))
            }
        }
    }
}
