//
//  GameModel.swift
//  MyCoachSportTest
//
//  Created by Luca Guarnieri on 13/04/2022.
//

import Foundation
import UIKit

enum Signs: String, CaseIterable {
    case rock = "👊"
    case scissors = "✌️"
    case paper = "🤚"
    
    var win: [Signs] {
        switch self {
        case .rock:
            return [.scissors]
        case .scissors:
            return [.paper]
        case .paper:
            return [.rock]
        }
    }
    
    var lose: [Signs] {
        switch self {
        case .rock:
            return [.paper]
        case .scissors:
            return [.rock]
        case .paper:
            return [.scissors]
        }
    }
}

enum GameResult {
    case PlayerOne
    case PlayerTwo
    case Draw
}

enum GameType {
    case PlayerVersusBot
    case BotVersusBot
}

