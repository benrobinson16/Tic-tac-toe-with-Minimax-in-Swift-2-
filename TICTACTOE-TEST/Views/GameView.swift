//
//  GameView.swift
//  TICTACTOE-TEST
//
//  Created by Ben Robinson on 08/12/2020.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: Game

    var body: some View {
        VStack {
            ForEach(0...2, id: \.self) { row in
                HStack {
                    ForEach(0...2, id: \.self) { column in
                        BoxView(selection: self.game.state[row][column]) {
                            self.game.humanPlay(row: row, column: column)
                        }
                        .padding()
                    }
                }
           }
        }
    }
}
