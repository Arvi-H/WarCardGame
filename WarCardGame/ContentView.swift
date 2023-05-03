//
//  ContentView.swift
//  WarCardGame
//
//  Created by Arvi Haxhillari on 5/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore:Int = 0
    @State var cpuScore:Int = 0
    
    var body: some View {
        ZStack {
            // App Background
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()
            
            // Main Content
            VStack {
                // App Logo
                Spacer()
                Image("logo")
                Spacer()
                
                // Main Cards
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                // Deal Button
                Spacer()
                 
                Button {
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                // Scoreboard
                HStack {
                    Spacer()
                    // Player Score
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    // CPU Score
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func deal() {
        let randomPlayerCard = Int.random(in: 2...14)
        let randomCPUCard = Int.random(in: 2...14)
        
        playerCard = "card" + String(randomPlayerCard)
        cpuCard = "card" + String(randomCPUCard)
        
        if (randomPlayerCard < randomCPUCard) {
            cpuScore += 1
        } else if (randomPlayerCard > randomCPUCard) {
            playerScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
