//
//  BotVsBotView.swift
//  MyCoachSportTest
//
//  Created by Luca Guarnieri on 13/04/2022.
//

import SwiftUI

struct BotVsBotView: View {
    @State private var moveToMenuView = false
    @State private var replayGame = false
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            
            Color("darkBlue")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("🤖")
                        .padding()
                        .font(.system(size: 100))
                    Spacer()
                    Text("🤖")
                        .padding()
                        .font(.system(size: 100))
                }
                
                Spacer()
                
                //MARK: Launch The Result View
                let playerOneSign = gameViewModel.randomSign()
                let playerTwoSign = gameViewModel.randomSign()
                ResultView(playerOneSign: playerOneSign, playerTwoSign: playerTwoSign, winner: gameViewModel.getWinningString(gameResult: gameViewModel.checkResult(firstPlayerSign: playerOneSign, secondPlayerSign: playerTwoSign), gameType: .BotVersusBot))
                
                HStack(spacing: 100) {
                    Button {
                        moveToMenuView.toggle()
                    } label: {
                        Text("MENU")
                    }
                    .buttonStyle(.bordered)
                    .font(.system(size: 25))
                    
                    Button {
                        replayGame.toggle()
                    } label: {
                        Text("REPLAY")
                    }
                    .buttonStyle(.bordered)
                    .font(.system(size: 25))
                }
            }
            if moveToMenuView {
                MenuView()
            }
            if replayGame {
                BotVsBotView()
            }
        }
    }
}

struct BotVsBotView_Previews: PreviewProvider {
    static var previews: some View {
        BotVsBotView()
    }
}
