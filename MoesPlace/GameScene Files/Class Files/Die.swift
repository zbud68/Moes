//
//  Die.swift
//  Farkle
//
//  Created by Mark Davis on 2/22/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//

import SpriteKit

class Die: SKSpriteNode {
    
    var scoringDie: Bool = Bool(false)
    var countThisRoll: Int = Int(0)
    var selected: Bool = Bool(false)
    var selectableDie: Bool = Bool(true)
}
