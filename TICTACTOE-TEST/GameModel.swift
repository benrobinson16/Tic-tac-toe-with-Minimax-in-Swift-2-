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
