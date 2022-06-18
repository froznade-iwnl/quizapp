//
//  EndCredit.swift
//  QuizApp
//
//  Created by CTSS Students on 15/6/22.
//

import SwiftUI

struct EndCredit: View {
    
    var myScore: Double
    var allScore: Int
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea(.all)
            
            VStack {
                ZStack {
                    CircleProgressBar(score: myScore, num: allScore)
                        .padding()
                    
                    Text(Int(myScore/Double(allScore)*100) > 90 ? "Congratulations~!" : "Nice Try!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
                Text("You Scored")
                    .padding()
                    .font(.title)
                
                Text("\(Int(myScore/Double(allScore)*100))%")
                    .font(.system(size: 64))
                    .padding(-25)
                
                HStack{
                    
                }
            }
        }
        
    }
}

struct EndCredit_Previews: PreviewProvider {
    static var previews: some View {
        EndCredit(myScore: 1, allScore: 5)
    }
}
