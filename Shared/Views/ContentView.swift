//
//  ContentView.swift
//  Shared
//
//  Created by Hur Ali on 20/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
            
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
               
            
            HStack {
                Text("1")
                    .bold()
                    
                Slider(value: self.$sliderValue, in: 1.0...100.0 )
                
                Text("100")
                    .bold()
            }
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
            }
            .alert(isPresented: self.$alertIsVisible, content: {
                let roundedValue = Int(self.sliderValue.rounded())
                
                return Alert(title: Text("Hello"), message: Text("Slider's value is \(roundedValue)\n"
                                +
                    "You scored \(self.game.points(sliderValue: roundedValue)) points"
                ), dismissButton: .default(Text("OK")))
            })
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
