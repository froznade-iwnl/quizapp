//
//  ContentView.swift
//  QuizApp
//
//  Created by CTSS Students on 15/6/22.
//

import SwiftUI

struct ContentView: View {
    
    let quiz = [
        Quiz(question: "Which of these is the larger company?", option1: "Microsoft", option2: "Google", option3: "Amazon", option4: "Apple", answer: 4),
        Quiz(question: "How many teeth are adult humans meant to have?", option1: "24", option2: "28", option3: "32", option4: "36", answer: 3),
        Quiz(question: "How long does a chicken egg take to hatch?", option1: "10 days", option2: "3 weeks", option3: "1 month", option4: "2 month", answer: 2),
        Quiz(question: "Where is Manila?", option1: "The Phillippines", option2: "The Philipines", option3: "The Philippines", option4: "The Fillippines", answer: 3),
        Quiz(question: "Which planet has a solid surface?", option1: "Venus", option2: "Jupiter", option3: "Saturn", option4: "Uranus", answer: 1),
        Quiz(question: "According to the U.S. Census Bureau, when were Baby Boomers Born?", option1: "1930-1945", option2: "1942-1964", option3: "1946-1964", option4: "1965-1984", answer: 3),
        Quiz(question: "How many pounds is equivelant to 5 kilograms", option1: "8", option2: "9", option3: "11", option4: "13", answer: 3),
        Quiz(question: "What does Loch mean in Scottish?", option1: "A eavine", option2: "A hill", option3: "A monster", option4: "A lake", answer: 2),
        Quiz(question: "Which of these composers has been decomposing the longest?", option1: "Johann Sebastian Bach", option2: "Frederic Chopin", option3: "Wolfgang Amadeus Mozart", option4: "Ludwig van Beethoven", answer: 1),
        Quiz(question: "Which of the following is NOT in an egg cream?", option1: "Milk", option2: "Carbonated Water", option3: "Flavoured Syrup", option4: "Egg", answer: 4),
        ]

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isAnswerCorrect = false
    @State var scoreCounter = 0
    @State var doneAnswering = false 
    @State var currentNumber = 0
    @State var percentage : Float = 0
    @State var timeRemainding = 10
    @State var itsOver = false
    @State var punchlineSize: CGFloat = 0.1
    
    var body: some View {
        ZStack{
            
//            LinearGradient(gradient: Gradient(colors: [.teal, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
            Color.orange
                .ignoresSafeArea(.all)
            
            VStack(){
                ProgressBar(value: percentage)
                    .frame(height: 20)
                    .padding()
                
                Text("Time Left: **\(timeRemainding)**s")
                    .onReceive(timer) { _ in
                    if timeRemainding > 0 {
                        timeRemainding -= 1
                    }
                    else {
                        doneAnswering = true
                        isAnswerCorrect = false
                        }
                    }
                    .padding()
                    .background(.brown)
                    .cornerRadius(500)
                    
                    
                Text(quiz[currentNumber%quiz.count].question)
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(width: 360, height: 200)
                    .background(.black)
                    .cornerRadius(12)
                    .padding()
                        
                
                HStack{
                    ZStack{// First Button
                        
                        Button(){
                            if(quiz[currentNumber%quiz.count].answer == 1) { isAnswerCorrect = true
                                scoreCounter += 1
                            }
                            doneAnswering = true
                        } label: {
                            Text(quiz[currentNumber%quiz.count].option1)
                                .foregroundColor(.white)
                                .padding()
                                .font(.title3)
                                .frame(width: 175, height: 200)
                                .background(.pink)
                                .cornerRadius(12)
                                
                        }
                    }
                    
                    ZStack{// 2nd Button
                  
                        Button(){
                            if(quiz[currentNumber%quiz.count].answer == 2) { isAnswerCorrect = true
                                scoreCounter += 1
                            }
                            doneAnswering = true
                        } label: {
                            Text(quiz[currentNumber%quiz.count].option2)
                                .foregroundColor(.white)
                                .padding()
                                .font(.title3)
                                .frame(width: 175, height: 200)
                                .background(.blue)
                                .cornerRadius(12)
                        }
                    }
                    
                }
                
                HStack{
                    
                    ZStack{// 3rd Button
                        
                        Button(){
                            if(quiz[currentNumber%quiz.count].answer == 3) { isAnswerCorrect = true
                                scoreCounter += 1
                            }
                            doneAnswering = true
                        } label: {
                            Text(quiz[currentNumber%quiz.count].option3)
                                .foregroundColor(.white)
                                .font(.title3)
                                .padding()
                                .frame(width: 175, height: 200)
                                .background(.green)
                                .cornerRadius(12)
                        }
                    }
                    
                    ZStack{ // 4th Button
                      
                        Button(){
                            if(quiz[currentNumber%quiz.count].answer == 4) { isAnswerCorrect = true
                                scoreCounter += 1
                            }
                            doneAnswering = true
                            
                        } label: {
                            Text(quiz[currentNumber%quiz.count].option4)
                                .foregroundColor(.white)
                                .padding()
                                .font(.title3)
                                .frame(width: 175, height: 200)
                                .background(.purple)
                                .cornerRadius(12)
                        }
                    }
                    
                }
            }
            .alert(isAnswerCorrect ? "Congratulations~! You answered correctly" : "Bzz Bzz!! You're wrong", isPresented: $doneAnswering){
                Button(role: .none){
                    timeRemainding = 10
                    punchlineSize = 0.1
                    withAnimation(.spring()) {
                        punchlineSize = 1
                    }
                    currentNumber += 1
                    print(Double(currentNumber/quiz.count))
                    percentage += 1.0/Float(quiz.count)
                    isAnswerCorrect = false
                    
                    if(currentNumber == quiz.count){
                        itsOver = true
                    }
                    
                }label:{
                    Text("Next")
                    
                }
            }
            .sheet(isPresented: $itsOver) {
                EndCredit(myScore: Double(scoreCounter), allScore: quiz.count)
            }
            .scaleEffect(punchlineSize)
            .onAppear(){
                withAnimation(.spring()) {
                    punchlineSize = 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
