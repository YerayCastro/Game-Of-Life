//
//  BoardView.swift
//  GameOfLife
//
//  Created by Yery Castro on 5/7/23.
//

import SwiftUI

struct BoardView: View {
    @Binding var board: BoardModel
    @Binding var isGridShowing: Bool
    
    var body: some View {
        let numRows = board.numRows
        let numCols = board.numCols
        let gridItemLayout = Array(
            repeating: GridItem(.flexible(), spacing: 0),
            count: numCols)
        
        LazyVGrid(
            columns: gridItemLayout,
            spacing: 0) {
                ForEach(0..<numCols*numRows, id: \.self) { i in
                    let creature = board.getCreature(i: i)
                    let vitality = board.vitality(creature: creature)
                    let isDead = creature == 0
                    Rectangle()
                        .fill(isDead ? Color.black : Color(
                            red: 1,
                            green: vitality,
                            blue: vitality))
                        .aspectRatio(1, contentMode: .fit)
                        .border(isGridShowing ? Color.blue : Color.clear)

                }
                
            }.overlay(
            Rectangle()
                .stroke(.pink.opacity(0.7), lineWidth: 1)
            )
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
                BoardView(
                    board: .constant(BoardModel.defaultBoard(numRows: 25, numCols: 25)),
                isGridShowing: .constant(false))
                .padding()
                Spacer()
            }
        }
    }
}
