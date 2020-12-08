//
//  AI.swift
//  TICTACTOE-TEST
//
//  Created by Ben Robinson on 08/12/2020.
//

import Foundation

class AI {
    
    func minimax(_ state: [[Selection]]) -> (row: Int, column: Int) {
        
        // 1.
        let possibleActions = availableActions(fromState: state)

        // 2.
        var bestAction = possibleActions[0]
        var bestScore = Int.min

        for action in possibleActions {

            // 3.
            let score = minimumScore(apply(player: .o, location: action, toState: state))
            
            // 4.
            if score > bestScore {
                bestAction = action
                bestScore = score
            }
        }

        return bestAction
    }
    
    private func minimumScore(_ state: [[Selection]]) -> Int {

        // 1.
        if isTerminal(gameState: state) {
            return utility(gameState: state)
        }

        let possibleActions = availableActions(fromState: state)
        var score = Int.max

        for action in possibleActions {
            // 2.
            score = min(score, maximumScore(apply(player: .x, location: action, toState: state)))
        }

        // 3.
        return score
    }
    
    private func maximumScore(_ state: [[Selection]]) -> Int {

        if isTerminal(gameState: state) {
            return utility(gameState: state)
        }

        let possibleActions = availableActions(fromState: state)
        var score = Int.min

        for action in possibleActions {
            score = max(score, minimumScore(apply(player: .o, location: action, toState: state)))
        }

        return score
    }
    
}
