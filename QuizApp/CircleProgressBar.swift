//
//  CircleProgressBar.swift
//  QuizApp
//
//  Created by CTSS Students on 15/6/22.
//

import SwiftUI

struct CircleProgressBar: View {
    @State var score: Double
    var num: Int
        
        var body: some View {
            VStack {
                ZStack {
                    Circle()
                        .stroke(
                            Color.blue.opacity(0.5),
                            lineWidth: 30
                        )
                    Circle()
                        .trim(from: 0, to: score / Double(num))
                        .stroke(
                            Color.blue,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                }
                .frame(width: 300, height: 300)
        }
}

struct CircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressBar(score: 2, num: 5)
    }
}
}
