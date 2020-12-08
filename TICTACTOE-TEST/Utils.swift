//
//  Utils.swift
//  TICTACTOE-TEST
//
//  Created by Ben Robinson on 08/12/2020.
//

import Foundation

func availableActions(fromState state: [[Selection]]) -> [(row: Int, column: Int)] {

    // 1.
    var actions: [(row: Int, column: Int)] = []

    // 2.
    for row in 0...2 {
        for column in 0...2 {

            // 3.
            if state[row][column] == .none {
                actions.append((row: row, column: column))
            }
        }
    }

    return actions
}

func apply(player: Selection, location: (row: Int, column: Int), toState state: [[Selection]]) -> [[Selection]] {
    var newState = state
    newState[location.row][location.column] = player
    return newState
}

func winner(fromState state: [[Selection]]) -> Selection {

    // Check for row
    for row in state {
        if row[0] == row[1] &&
           row[0] == row[2] &&
           row[0] != .none {
            return row[0]
        }
    }

    // Check for column
    for column in 0...2 {
        if state[0][column] == state[1][column] &&
           state[0][column] == state[2][column] &&
           state[0][column] != .none {
            return state[0][column]
        }
    }

    // Check for diagonal
    if state[0][0] == state[1][1] &&
       state[0][0] == state[2][2] &&
       state[0][0] != .none {
        return state[0][0]
    } else if state[0][2] == state[1][1] &&
              state[0][2] == state[2][0] &&
              state[0][2] != .none {
        return state[0][2]
    }

    return .none
}

func utility(gameState: [[Selection]]) -> Int {
    let outcome = winner(fromState: gameState)

    switch outcome {

    // Player wins
    case .x:
        return -1

    // Draw
    case .none:
        return 0

    // AI wins
    case .o:
        return 1
    }
}


func isTerminal(gameState: [[Selection]]) -> Bool {
    if winner(fromState: gameState) != .none {
        // There is a winner
        return true
    } else if availableActions(fromState: gameState).count == 0 {
        // It is a draw as all boxes are filled
        return true
    }
    return false
}
