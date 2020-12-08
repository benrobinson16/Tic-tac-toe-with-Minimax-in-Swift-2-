//
//  ContentView.swift
//  TICTACTOE-TEST
//
//  Created by Ben Robinson on 08/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: testMinimax)
    }

    func testMinimax() {
        let board: [[Selection]] = [[.x, .none, .none],
                                    [.none, .none, .none],
                                    [.none, .o, .x]]
        let ai = AI()
        print(ai.minimax(board))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
