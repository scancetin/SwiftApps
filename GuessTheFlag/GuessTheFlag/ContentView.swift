//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Can Cetin on 2.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
            
            VStack {
                VStack {
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.black))
                        .padding(20)
                    Text("What is the flag of")
                        .foregroundColor(.white)
                        .font(.headline.bold())
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.bold())
                }.padding(50)

                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number].lowercased())
                            .renderingMode(.original)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 10)
                    }
                }
            }
        }.ignoresSafeArea()
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: newQuestion)
            } message: {
                Text("Your score is \(score)")
            }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct Answer"
            score += 1
        } else {
            scoreTitle = "False Answer"
        }
        showingScore = true
    }
    
    func newQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
