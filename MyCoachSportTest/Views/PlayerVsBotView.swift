//
//  PlayerVsBotView.swift
//  MyCoachSportTest
//
//  Created by Luca Guarnieri on 13/04/2022.
//

import SwiftUI

struct PlayerVsBotView: View {
    @State private var moveToMenuView = false
    @State private var replayGame = false
    @State private var playerMadeAChoice: Signs?
    @StateObject private var gameViewModel = GameViewModel()
    var body: some View {
        ZStack {
            Color("darkBlue")
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("👨‍🦲")
                        .padding()
                        .font(.system(size: 100))
                    Spacer()
                    Text("🤖")
                        .padding()
                        .font(.system(size: 100))
                }
                
                ZStack {
                    //MARK: Creating Signs Programatically According To The Signs Existing In Game
                    HStack {
                        ForEach(Signs.allCases, id: \.rawValue) { sign in
                            Button(sign.rawValue) {
                                playerMadeAChoice = sign.self
                            }
                            .buttonStyle(.bordered)
                            .font(.system(size: 50))
                        }
                    }
                    //MARK: When The User Chose A Sign, Launch The Result View
                    if let playerOneSign = playerMadeAChoice {
                        let playerTwoSign = gameViewModel.randomSign()
                        ResultView(playerOneSign: playerOneSign, playerTwoSign: playerTwoSign, winner: gameViewModel.getWinningString(gameResult: gameViewModel.checkResult(firstPlayerSign: playerOneSign, secondPlayerSign: playerTwoSign), gameType: .PlayerVersusBot))
                    }
                }
                
                Spacer()
                
                HStack(spacing: 100) {
                    Button {
                        moveToMenuView.toggle()
                    } label: {
                        Text("MENU")
                    }
                    .buttonStyle(.bordered)
                    .font(.system(size: 25))
                    
                    if (playerMadeAChoice != nil) {
                        Button {
                            replayGame.toggle()
                        } label: {
                            Text("REPLAY")
                        }
                        .buttonStyle(.bordered)
                        .font(.system(size: 25))
                    }
                }
            }
            if moveToMenuView {
                MenuView()
            }
            if replayGame {
                PlayerVsBotView()
            }
        }
    }
}

struct PlayerVsBotView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerVsBotView()
    }
}
