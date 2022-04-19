//
//  ResultView.swift
//  MyCoachSportTest
//
//  Created by Luca Guarnieri on 13/04/2022.
//

import SwiftUI

struct ResultView: View {
    var playerOneSign: Signs
    var playerTwoSign: Signs
    var winner: String
    var body: some View {
        ZStack {
            Color("darkBlue")
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack(spacing: 50) {
                    Text(playerOneSign.rawValue)
                        .font(.system(size: 50))
                    Text(winner)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Text(playerTwoSign.rawValue)
                        .font(.system(size: 50))
                }
                Spacer()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(playerOneSign: .rock, playerTwoSign: .paper, winner: "")
    }
}
