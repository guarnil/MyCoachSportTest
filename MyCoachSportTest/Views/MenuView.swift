//
//  MenuView.swift
//  MyCoachSportTest
//
//  Created by Luca Guarnieri on 13/04/2022.
//

import SwiftUI

struct MenuView: View {
    @State var botVersusBotActivated:Bool = false
    @State private var moveToGameView = false
    var body: some View {
        ZStack {
            Color("darkBlue")
                .ignoresSafeArea()
                    VStack() {
                        Text("👊 🤚 ✌️")
                            .font(.system(size: 50))
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Button("START") {
                            moveToGameView.toggle()
                        }
                            .buttonStyle(.bordered)
                            .font(.system(size: 50))
                        
                        Spacer()
                        
                        //MARK: Change the game type (IA VS IA OR HUMAN VS IA)
                        HStack {
                            Button(action: {
                                self.botVersusBotActivated = !self.botVersusBotActivated
                            }) {
                                Text((botVersusBotActivated == true) ? "🤖 VS 🤖" : "👨‍🦲 VS 🤖")
                            }
                            .buttonStyle(.bordered)
                            .font(.system(size: 50))
                            .accessibilityIdentifier("changeGameTypeButton")
                        }
                    }
            
            if moveToGameView {
                if botVersusBotActivated {
                    BotVsBotView()
                } else {
                    PlayerVsBotView()
                }
            }
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
