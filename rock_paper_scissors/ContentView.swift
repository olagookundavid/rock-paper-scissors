//
//  ContentView.swift
//  rock_paper_scissors
//
//  Created by David OH on 09/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var didWin = false
    @State private var playerChoice = ""
    @State private var computerChoice = ""
    @State private var playerScore = 0
    @State private var computerScore = 0
    @State private var totalPlays = 0
    @State private var isPresented = false
    @State private var winningMsg = ""
    
    @State private var possibleChoice = ["rock","paper","scissors"]
    
    func getCompPlay(){
        computerChoice = possibleChoice[Int.random(in: 0...2)]
        
        
        if totalPlays < 9 {
            if(playerChoice == "rock" && computerChoice == "paper"){
                computerScore += 1
            }
            else if(playerChoice == "rock" && computerChoice == "scissors"){
                playerScore += 1
            }
            else if(playerChoice == "paper" && computerChoice == "rock"){
                playerScore += 1
            }
            else if(playerChoice == "paper" && computerChoice == "scissors"){
                computerScore += 1
            }
            else if(playerChoice == "scissors" && computerChoice == "paper"){
                playerScore += 1
            }
            else if(playerChoice == "scissors" && computerChoice == "rock"){
                computerScore += 1
            }
            else{
                
            }
            totalPlays += 1
        }
        else{
            if playerScore > computerScore{
                winningMsg = "You Won, hurray 🥳🎊"
            }
            else if playerScore < computerScore{
                winningMsg = "You Lost, try again 🤝"
            }else{
                winningMsg = "It's a draw 😐"
            }
            isPresented = true
        }
    }
    
    func startOver(){
        playerScore = 0
        computerScore = 0
        totalPlays = 0
    }
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text("""
                         Computer
                         Current
                         Score
                         """)
                        .bold()
                        .padding(.bottom)
                        .foregroundColor(.red)
                    
                    Text(String(computerScore))
                        .foregroundColor(.green)
                        .font(.title)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("""
                         Player
                         Current
                         Score
                         """)
                    .bold()
                    .padding(.bottom)
                    .foregroundColor(.red)
                    Text(String(playerScore))
                        .foregroundColor(.green)
                        .font(.title)
                }
            }
            Spacer()
            Text("Computer played: \(computerChoice)")
                .font(.headline)
                .padding(.bottom, 5)
            Text("You played: \(playerChoice)")
                .font(.headline)
                .padding(.bottom)
            Text("Choose Rock, Paper or Scissors")
                .font(.title2)
                .bold()
                .padding(.bottom)
            HStack{
                Button {
                    playerChoice = "rock"
                    getCompPlay()
                }label: {
                    Text("Rock")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title2)
                }
                Spacer()
                Button {
                    playerChoice = "paper"
                    getCompPlay()
                }label: {
                    Text("Paper")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title2)
                }
                Spacer()
                Button {
                    playerChoice = "scissors"
                    getCompPlay()
                }label: {
                    Text("Scissors")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title2)
                }
            }
            Spacer()
            Spacer()
        }
        .padding(30)
        .alert(winningMsg, isPresented: $isPresented){
            Button("Start Over", action: startOver)
        }.background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
