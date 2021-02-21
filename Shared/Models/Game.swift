//
//  Game.swift
//  Bulls Eye (iOS)
//
//  Created by Hur Ali on 20/02/2021.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 0
    
    func points(sliderValue: Int) -> Int {
        return 100 - abs(self.target - sliderValue)
    }
}
