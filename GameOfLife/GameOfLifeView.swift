//
//  ContentView.swift
//  GameOfLife
//
//  Created by Yery Castro on 5/7/23.
//

import SwiftUI

struct GameOfLifeView: View {
    @State var board: BoardModel
    @State var isGridShowing: Bool = false
    @State var isPlaying: Bool = true
    
    @State var timer = Timer
        .publish(
            every: 1,
            tolerance: 0.5,
            on: .main,
            in: .common).autoconnect()
    
    @State var speed: Double
    @State var rulesShowing: Bool = false
    @State var infoShowing: Bool = false
    @State var disableAllButtons: Bool = false
    
    let DIM = 25
    let MIN_SECONDS: Double = 0.01
    let MAX_SECONDS: Double = 3.0
    let MAX_SPEED: Double = 10.0
    var MAX_TIME: Double {
        return MAX_SPEED / 2
    }
    
    init() {
        board = BoardModel(
            numRows: DIM,
            numCols: DIM)
        
        // Init speed
        let a = -(MAX_SECONDS - MIN_SECONDS) / MAX_SPEED
        
        speed = 1 / a * (1.5 - MAX_SECONDS)
    }
    
    var body: some View {
        ZStack {
            bgColor.opacity(0.9).ignoresSafeArea()
            VStack {
                // Cool Title View
                CoolTitleView()
                
                Spacer()
                
                // Board View
                BoardView(
                    board: $board,
                    isGridShowing: $isGridShowing)
                .onReceive( timer) { time in
                    self.timer.upstream.connect().cancel()
                    
                    let a = -(MAX_SECONDS - MIN_SECONDS) / MAX_SPEED
                    
                    timer = Timer
                        .publish(
                            every: a * speed + MAX_SECONDS,
                            tolerance: 0.5,
                            on: .main,
                            in: .common).autoconnect()
                    if isPlaying {
                        board.nextGeneration()
                    }
                }
                
                Spacer()
                
                // Controls View: Sliders and some buttons
//                Text("Controls View")
                ControlView(isPlaying: $isPlaying,
                            isGridShowing: $isGridShowing,
                            rulesShowing: $rulesShowing,
                            infoShowing: $infoShowing,
                            speed: $speed,
                            board: $board,
                            disableAllButtons: $disableAllButtons)
            }
            .padding()
            
            if rulesShowing {
                RulesView(surviveRules: $board.surviveRules,
                          bornRules: $board.bornRules,
                          rulesShowing: $rulesShowing,
                          disableAllButtons: $disableAllButtons,
                          defaultSurviveRules: board.defaultSurviveRules,
                          defaultBornRules: board.defaultBornRules)
            }
            
            if infoShowing {
                InfoView(infoShowing: $infoShowing,
                         disableAllButtons: $disableAllButtons)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameOfLifeView()
    }
}
