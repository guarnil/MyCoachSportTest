//
//  GameViewModel.swift
//  MyCoachSportTest
//
//  Created by Luca Guarnieri on 13/04/2022.
//

import Foundation

class GameViewModel : ObservableObject {
    
    func randomSign() -> Signs {
        if let randomSign = Signs.allCases.randomElement() {
            return randomSign
        }
        return Signs.paper
    }
    
    func checkResult(firstPlayerSign: Signs, secondPlayerSign: Signs) -> GameResult {
        if firstPlayerSign.win.contains(secondPlayerSign) {
            return .PlayerOne
        } else if firstPlayerSign.lose.contains(secondPlayerSign) {
            return .PlayerTwo
        }
        return .Draw
    }
    
    func getWinningString(gameResult: GameResult, gameType: GameType) -> String {
        switch gameResult {
        case .PlayerOne:
            switch gameType {
            case .PlayerVersusBot:
                return "👨‍🦲\nWIN"
            case .BotVersusBot:
                return "🤖\nBOT ONE WIN"
            }
        case .PlayerTwo:
            switch gameType {
            case .PlayerVersusBot:
                return "🤖\nBOT WIN"
            case .BotVersusBot:
                return "🤖\nBOT TWO WIN"
            }
        case .Draw:
            return "DRAW"
        }
    }
    
}
