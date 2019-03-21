//
//  Dice_Ext.swift
//  Farkle
//
//  Created by Mark Davis on 2/11/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//
import SpriteKit

extension GameScene {
    
    func setupDieFaces() {
        dieFaceArray = [dieFace1, dieFace2, dieFace3, dieFace4, dieFace5, dieFace6]
    }

    func setupDice() {
        
        die1.texture = GameConstants.Textures.Die1
        die1.name = "Die 1"
        die1.faceValue = 1
        die2.texture = GameConstants.Textures.Die2
        die2.name = "Die 2"
        die2.faceValue = 2
        die3.texture = GameConstants.Textures.Die3
        die3.name = "Die 3"
        die3.faceValue = 3
        die4.texture = GameConstants.Textures.Die4
        die4.name = "Die 4"
        die4.faceValue = 4
        die5.texture = GameConstants.Textures.Die5
        die5.name = "Die 5"
        die5.faceValue = 5
        die6.texture = GameConstants.Textures.Die6
        die6.name = "Die 6"
        die6.faceValue = 6

        switch currentGame.numDice {
        case 5:
            diceArray = [die1, die2, die3, die4, die5]
        case 6:
            diceArray = [die1, die2, die3, die4, die5, die6]
        default:
            break
        }
        
        currentDiceArray = diceArray
    
        for die in currentDiceArray {
            die.physicsBody = SKPhysicsBody(rectangleOf: GameConstants.Sizes.Dice)
            die.physicsBody?.affectedByGravity = false
            die.physicsBody?.isDynamic = true
            die.physicsBody?.allowsRotation = true
            die.physicsBody?.categoryBitMask = 1
            die.physicsBody?.contactTestBitMask = 1
            die.physicsBody?.collisionBitMask = 1
            die.physicsBody?.restitution = 0.5
            die.physicsBody?.linearDamping = 4
            die.physicsBody?.angularDamping = 5
        }
        positionDice()
    }
    
    func positionDice() {
        for die in currentDiceArray {
            die.zRotation = 0
            die.zPosition = GameConstants.ZPositions.Dice
            die.size = GameConstants.Sizes.Dice
            
            switch die.name {
            case "Die 1":
                die1.position = CGPoint(x: -(gameTable.size.width / 7), y: gameTable.frame.minY + 100)
            case "Die 2":
                die2.position = CGPoint(x: die1.position.x + die2.size.width, y: gameTable.frame.minY + 100)
            case "Die 3":
                die3.position = CGPoint(x: die2.position.x + die3.size.width, y: gameTable.frame.minY + 100)
            case "Die 4":
                die4.position = CGPoint(x: die3.position.x + die4.size.width, y: gameTable.frame.minY + 100)
            case "Die 5":
                die5.position = CGPoint(x: die4.position.x + die5.size.width, y: gameTable.frame.minY + 100)
            case "Die 6":
                die6.position = CGPoint(x: die5.position.x + die6.size.width, y: gameTable.frame.minY + 100)
            default:
                break
            }
            gameTable.addChild(die)
        }
    }
    
    func resetDice() {
        die1.texture = GameConstants.Textures.Die1
        die1.name = "Die 1"
        die1.faceValue = 1
        die2.texture = GameConstants.Textures.Die2
        die2.name = "Die 2"
        die2.faceValue = 2
        die3.texture = GameConstants.Textures.Die3
        die3.name = "Die 3"
        die3.faceValue = 3
        die4.texture = GameConstants.Textures.Die4
        die4.name = "Die 4"
        die4.faceValue = 4
        die5.texture = GameConstants.Textures.Die5
        die5.name = "Die 5"
        die5.faceValue = 5
        die6.texture = GameConstants.Textures.Die6
        die6.name = "Die 6"
        die6.faceValue = 6
    }
    
    /*
        currentScore = 0
        currentPlayer.currentRollScore = 0
        for dieFace in dieFaceArray {
            dieFace.countThisRoll = 0
        }
    
        for die in diceArray {
            die.face = 0
            die.physicsBody?.pinned = false
            
            die.zRotation = 0
            die.zPosition = GameConstants.ZPositions.Dice
            die.size = GameConstants.Sizes.Dice
            
            switch die.name {
            case "Die 1":
                die1.position = CGPoint(x: -(gameTable.size.width / 7), y: gameTable.frame.minY + 100)
                die1.texture = GameConstants.Textures.Die1
                
            case "Die 2":
                die2.position = CGPoint(x: die1.position.x + die2.size.width, y: gameTable.frame.minY + 100)
                die2.texture = GameConstants.Textures.Die2
            case "Die 3":
                die3.position = CGPoint(x: die2.position.x + die3.size.width, y: gameTable.frame.minY + 100)
                die3.texture = GameConstants.Textures.Die3
            case "Die 4":
                die4.position = CGPoint(x: die3.position.x + die4.size.width, y: gameTable.frame.minY + 100)
                die4.texture = GameConstants.Textures.Die4
            case "Die 5":
                die5.position = CGPoint(x: die4.position.x + die5.size.width, y: gameTable.frame.minY + 100)
                die5.texture = GameConstants.Textures.Die5
            case "Die 6":
                die6.position = CGPoint(x: die5.position.x + die6.size.width, y: gameTable.frame.minY + 100)
                die6.texture = GameConstants.Textures.Die6
            default:
                break
            }
        }
        currentDiceArray = diceArray
    */
 

    //MARK: ********** Roll Dice **********
    
    func rollDice() {
        getFaceValues()
        
        print("first roll: \(currentPlayer.firstRoll)")
        print(currentDiceArray)
        for die in currentDiceArray where die.rollable == true {
            if !currentPlayer.firstRoll {
                currentGame.numRollableDice -= 1
                if currentGame.numRollableDice == 0 {
                    playerState = .NewRoll
                }
                playerState = .Idle
                currentPlayer.firstRoll = false
            }
            rollDiceAction(die: die, isComplete: handlerBlock)

            die.faceValue = Int(arc4random_uniform(6)+1)
            let dieTexture = dieFaceTextures[die.faceValue - 1]
            switch die.faceValue {
            case 1:
                die.texture = dieTexture
                die.countThisRoll += 1
                die.points = 100
                die.scoring = true
                die.rollable = true
            case 2:
                die.texture = dieTexture
                die.countThisRoll += 1
                die.points = 2
                die.scoring = false
                die.rollable = true
            case 3:
                die.texture = dieTexture
                die.countThisRoll += 1
                die.points = 3
                die.scoring = false
                die.rollable = true
            case 4:
                die.texture = dieTexture
                die.countThisRoll += 1
                die.points = 4
                die.scoring = false
                die.rollable = true
            case 5:
                die.texture = dieTexture
                die.countThisRoll += 1
                die.points = 50
                die.scoring = true
                die.rollable = true
            case 6:
                die.texture = dieTexture
                die.countThisRoll += 1
                die.points = 6
                die.scoring = false
                die.rollable = true
            default:
                break
            }
        }
        let currentRollScores = evaluateLikeDice(dice: currentDiceArray)
        print("currentRollScores: \(currentRollScores)")
        playerState = .Idle
    }
    
    func getFaceValues() {
        for die in currentDiceArray where die.rollable == true {
            die.faceValue = Int(arc4random_uniform(6)+1)
        }
    }
    
    func rollDiceAction(die: Die, isComplete: (Bool) -> Void) {
        
        let Wait = SKAction.wait(forDuration: 0.75)
        
        if let RollAction = SKAction(named: "RollDice") {
            rollAction = RollAction
        }
        
        let MoveAction = SKAction.run {
        let randomX = CGFloat(arc4random_uniform(5) + 5)
        let randomY = CGFloat(arc4random_uniform(2) + 3)
        
        die.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
        die.physicsBody?.applyTorque(3)
        }
        
        let FadeOut = SKAction.fadeAlpha(to: 0, duration: 0.75)
        let FadeIn = SKAction.fadeAlpha(to: 1, duration: 0.75)
        
        let RepositionDice = SKAction.run {
            self.repositionDice(die: die)
        }
        
        let Group = SKAction.group([rollAction, MoveAction])
        
        let Seq = SKAction.sequence([Group, Wait, FadeOut, RepositionDice, FadeIn])
        
        die.position = CGPoint(x: 0, y: 0)
        
        die.run(Seq)
        
        isComplete(true)

    }

    func repositionDice(die: Die) {
        die.zRotation = 0
        die.zPosition = GameConstants.ZPositions.Dice
        die.size = GameConstants.Sizes.Dice
        
        /*
        if die.selected == true {
            currentDieTexture = die.SelectedDieTexture
        } else {
            currentDieTexture = die.UnSelectedDieTexture
        }
        */
        
        switch die.name {
        case "Die 1":
            die1.texture = GameConstants.Textures.Die1
            die1.position = CGPoint(x: -(gameTable.size.width / 7), y: gameTable.frame.minY + 100)
        case "Die 2":
            die2.texture = GameConstants.Textures.Die2
            die2.position = CGPoint(x: die1.position.x + die2.size.width, y: gameTable.frame.minY + 100)
        case "Die 3":
            die3.texture = GameConstants.Textures.Die3
            die3.position = CGPoint(x: die2.position.x + die3.size.width, y: gameTable.frame.minY + 100)
        case "Die 4":
            die4.texture = GameConstants.Textures.Die4
            die4.position = CGPoint(x: die3.position.x + die4.size.width, y: gameTable.frame.minY + 100)
        case "Die 5":
            die5.texture = GameConstants.Textures.Die5
            die5.position = CGPoint(x: die4.position.x + die5.size.width, y: gameTable.frame.minY + 100)
        case "Die 6":
            die6.texture = GameConstants.Textures.Die6
            die6.position = CGPoint(x: die5.position.x + die6.size.width, y: gameTable.frame.minY + 100)
        default:
            break
        }
    }
}
