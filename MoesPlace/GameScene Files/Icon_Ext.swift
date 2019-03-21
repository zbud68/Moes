//
//  Icon_Ext.swift
//  Farkle
//
//  Created by Mark Davis on 2/11/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//
import SpriteKit

extension GameScene {
    func setupIconWindowIcons() {
        
        pauseIcon.texture = SKTexture(imageNamed: "GreenPause")
        pauseIcon.name = "Pause"
        pauseIcon.size = CGSize(width: 32, height: 32)
        pauseIcon.zPosition = GameConstants.ZPositions.Icon
        
        pauseIcon.position = CGPoint(x: (pauseIcon.size.width / 2) - (iconWindow.size.width / 3) + 3, y: iconWindow.size.height / 3 - pauseIcon.size.height)
        
        rollDiceIcon.texture = SKTexture(imageNamed: "IconRed")
        rollDiceIcon.position = CGPoint(x: pauseIcon.position.x + 60, y: iconWindow.size.height / 5 - rollDiceIcon.size.height)
        rollDiceIcon.name = "RollDice"
        rollDiceIcon.size = CGSize(width: 60, height: 40)
        rollDiceIcon.zPosition = GameConstants.ZPositions.Dice
        
        keepScoreIcon.texture = SKTexture(imageNamed: "IconGreen")
        keepScoreIcon.position = CGPoint(x: rollDiceIcon.position.x, y: rollDiceIcon.position.y - 40)
        keepScoreIcon.name = "KeepScore"
        keepScoreIcon.size = CGSize(width: 60, height: 40)
        keepScoreIcon.zPosition = GameConstants.ZPositions.Dice
        
        setupIconWindowIconsArray()
    }

    func setupMainMenuIconsArray() {
        mainMenuIconsArray = [newGameIcon, resumeIcon, settingsIcon, exitIcon, infoIcon]
    }
    
    func setupSettingsMenuIconsArray() {
        settingsMenuIconsArray = [soundIcon, backIcon]
    }
    
    func setupIconWindowIconsArray() {        
        iconWindowIconsArray = [pauseIcon, rollDiceIcon, keepScoreIcon]
    }
    
    func addIconWindowIcons() {
        iconWindow.addChild(pauseIcon)
        iconWindow.addChild(rollDiceIcon)
        iconWindow.addChild(keepScoreIcon)
    }
}
