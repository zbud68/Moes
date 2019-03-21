//
//  Player.swift
//  Farkle
//
//  Created by Mark Davis on 2/12/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//

import SpriteKit

class Player {
    let nameLabel: SKLabelNode = SKLabelNode()
    var name: String = ""

    var score: Int
    var currentRollScore: Int
    let scoreLabel: SKLabelNode = SKLabelNode()
    var hasScoringDice: Bool
    var firstRoll: Bool = true
    
    init(score: Int, currentRollScore: Int, hasScoringDice: Bool)
    {
        self.score = score
        self.currentRollScore = currentRollScore
        self.hasScoringDice = hasScoringDice
    }
}

