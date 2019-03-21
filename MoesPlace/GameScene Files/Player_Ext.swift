//
//  Player_Ext.swift
//  Farkle
//
//  Created by Mark Davis on 2/12/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//

import SpriteKit

extension GameScene {

    func setupPlayers() {
        
        player1.nameLabel.text = "Player 1"
        player2.nameLabel.text = "Player 2"
        player3.nameLabel.text = "Player 3"
        player4.nameLabel.text = "Player 4"
        
        switch currentGame.numPlayers {
        case 1:
            playersArray = [player1]
        case 2:
            playersArray = [player1, player2]
        case 3:
            playersArray = [player1, player2, player3]
        case 4:
            playersArray = [player1, player2, player3, player4]
        default:
            playersArray = [player1, player2]
        }
        for player in playersArray {
            player.name = player.nameLabel.text!
            player.scoreLabel.text = String(player.score)
            player.name = player.nameLabel.text!
            scoresWindow.addChild(player.nameLabel)
            scoresWindow.addChild(player.scoreLabel)
        }
        positionPlayerLabels()
    }
    
    func positionPlayerLabels() {
        for player in playersArray {
            player.nameLabel.fontName = GameConstants.StringConstants.FontName
            player.scoreLabel.fontName = GameConstants.StringConstants.FontName
            player.nameLabel.fontSize = GameConstants.Sizes.PlayerNameLabelFont
            player.scoreLabel.fontSize = GameConstants.Sizes.PlayerScoreLabelFont
            player.nameLabel.fontColor = GameConstants.Colors.PlayerNameLabelFont
            player.scoreLabel.fontColor = GameConstants.Colors.PlayerScoreLabelFont
            player.nameLabel.zPosition = GameConstants.ZPositions.NameLabel
            player.scoreLabel.zPosition = GameConstants.ZPositions.ScoreLabel
            
            
            switch player.name {
            case "Player 1":
                player1.nameLabel.position = CGPoint(x: 0, y: (scoresWindow.frame.height / 4) + 15)
                
                player1.scoreLabel.position = CGPoint(x: player1.nameLabel.position.x, y: player1.nameLabel.position.y - 30)
            case "Player 2":
                player2.nameLabel.position = CGPoint(x: 0, y: player1.nameLabel.position.y - 60)
                
                player2.scoreLabel.position = CGPoint(x: player1.nameLabel.position.x, y: player2.nameLabel.position.y - 30)
            case "Player 3":
                player3.nameLabel.position = CGPoint(x: 0, y: player2.nameLabel.position.y - 60)
                player3.scoreLabel.position = CGPoint(x: player2.nameLabel.position.x, y: player3.nameLabel.position.y - 30)
            case "Player 4":
                player4.nameLabel.position = CGPoint(x: 0, y: player3.nameLabel.position.y - 60)
                
                player4.scoreLabel.position = CGPoint(x: player3.nameLabel.position.x, y: player4.nameLabel.position.y - 25)
            default:
                break
            }
        }
    }
}
