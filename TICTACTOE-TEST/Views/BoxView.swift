//
//  BoxView.swift
//  TICTACTOE-TEST
//
//  Created by Ben Robinson on 08/12/2020.
//

import SwiftUI

struct BoxView: View {
    let selection: Selection
    let onTap: () -> Void

    let width = UIScreen.main.bounds.width / 5

    var body: some View {
        Text(selection.rawValue)
            .font(.system(.largeTitle, design: .rounded))
            .fontWeight(.bold)
            .frame(width: width, height: width)
            .background(Color(UIColor.systemGray5))
            .onTapGesture { self.onTap() }
    }
}
