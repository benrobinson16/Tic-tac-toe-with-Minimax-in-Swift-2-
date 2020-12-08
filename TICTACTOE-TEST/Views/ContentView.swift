//
//  ContentView.swift
//  TICTACTOE-TEST
//
//  Created by Ben Robinson on 08/12/2020.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = Game()

    var body: some View {
        VStack {
            Text(game.title)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
//                .foregroundColor(game.winnerColor)
                .padding()
                .padding(.bottom)
            GameView(game: game)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
