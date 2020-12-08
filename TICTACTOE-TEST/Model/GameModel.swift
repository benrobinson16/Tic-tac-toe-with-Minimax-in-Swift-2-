//
//  GameModel.swift
//  TICTACTOE-TEST
//
//  Created by Ben Robinson on 08/12/2020.
//

import Foundation

enum Selection: String {
    case x = "X"
    case o = "O"
    case none = ""
}

let startState: [[Selection]] = [[.none, .none, .none],
                                 [.none, .none, .none],
                                 [.none, .none, .none]]

class Game: ObservableObject {
    @Published var state: [[Selection]] = startState
    @Published var title: String = "Tap a box to start"
    private var canPlay = true
    private let ai = AI()

    func humanPlay(row: Int, column: Int) {

        // 1.
        guard canPlay else { return }
        guard row < 3 && row >= 0 else { return }
        guard column < 3 && column >= 0 else { return }

        // 2.
        canPlay = false
        state[row][column] = .x

        // 3.
        if isTerminal(gameState: state) {
            end()
        } else {
            title = "Computer playing"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: aiPlay)
        }
    }
    
    private func aiPlay() {

        // 1.
        title = "Computer playing"

        // 2.
        let action = ai.minimax(state)
        state[action.row][action.column] = .o

        // 3.
        if isTerminal(gameState: state) {
            end()
        } else {
            canPlay = true
            title = "Make your move"
        }
    }
    
    private func end() {

        // 1.
        let gameWinner = winner(fromState: state)
        switch gameWinner {
        case .x:
            title = "You win!"
        case .none:
            title = "It's a draw."
        case .o:
            title = "Computer wins."
        }

        // 2.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: reset)
    }
    
    private func reset() {

        // 1.
        state = startState

        // 2.
        let randomNum = Int.random(in: 1...2)
        if randomNum == 1 {
            aiPlay()
        } else {
            title = "Tap a box to start"
            canPlay = true
        }
    }
}
