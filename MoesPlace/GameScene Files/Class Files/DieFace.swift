//
//  DieFace.swift
//  Farkle
//
//  Created by Mark Davis on 2/12/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//

import SpriteKit

class DieFace {
    
    let name: String
    var faceValue: Int
    var pointValue: Int
    var scoringDie: Bool
    var countThisRoll: Int
    
    init(name: String, faceValue: Int, pointValue: Int, scoringDie: Bool, countThisRoll: Int)
    {
        self.name = name
        self.faceValue = faceValue
        self.pointValue = pointValue
        self.scoringDie = scoringDie
        self.countThisRoll = countThisRoll
    }
}
