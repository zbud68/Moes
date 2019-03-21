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
        die2.texture = GameConstants.Textures.Die2
        die2.name = "Die 2"
        die3.texture = GameConstants.Textures.Die3
        die3.name = "Die 3"
        die4.texture = GameConstants.Textures.Die4
        die4.name = "Die 4"
        die5.texture = GameConstants.Textures.Die5
        die5.name = "Die 5"
        die6.texture = GameConstants.Textures.Die6
        die6.name = "Die 6"

        diceArray = [die1, die2, die3, die4, die5]

        if currentGame.numDice == 6 {
            diceArray.append(die6)
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
        die2.texture = GameConstants.Textures.Die2
        die2.name = "Die 2"
        die3.texture = GameConstants.Textures.Die3
        die3.name = "Die 3"
        die4.texture = GameConstants.Textures.Die4
        die4.name = "Die 4"
        die5.texture = GameConstants.Textures.Die5
        die5.name = "Die 5"
        die6.texture = GameConstants.Textures.Die6
        die6.name = "Die 6"
    }

    //MARK: ********** Roll Dice **********
    
    func rollDice() {
        if currentPlayer.firstRoll {
            selectedDiceArray.removeAll()
        }
        for die in currentDiceArray {
            if die.selected {
                die.selectableDie = false
                selectedDiceArray.append(die)
            }
        }
        currentDiceArray.removeAll(where: {$0.selectableDie == false})
        getDice()
        currentPlayer.firstRoll = false
    }

    func getDice() {
        var dieValues = [Int]()

        for dieFace in dieFaceArray {
            dieFace.countThisRoll = 0
        }
        
        for _ in currentDiceArray {
            dieValues.append(Int(arc4random_uniform(6)+1))
        }
        countDieValues(values: dieValues)
        var id = 0
        for die in currentDiceArray {
            let currentDieValue = dieValues[id]
            
            rollDiceAction(die: die, currentDieValue: currentDieValue, isComplete: handlerBlock)
            id += 1
        }
    }
    
    func countDieValues(values: [Int]) {
        let currentDieValues = values
    
        for value in currentDieValues {
            dieFaceArray[value - 1].countThisRoll += 1
        }
    }
    
    func rollDiceAction(die: Die, currentDieValue: Int, isComplete: (Bool) -> Void) {
        let currentDie = die
        let currentDieValue = currentDieValue
        
        let Wait = SKAction.wait(forDuration: 0.1)
        
        if let RollAction = SKAction(named: "RollDice") {
            rollAction = RollAction
        }
        
        let MoveAction = SKAction.run {
        let randomX = CGFloat(arc4random_uniform(5) + 5)
        let randomY = CGFloat(arc4random_uniform(2) + 3)
        
        currentDie.physicsBody?.applyImpulse(CGVector(dx: randomX, dy: randomY))
        currentDie.physicsBody?.applyTorque(3)
        }
        
        let FadeOut = SKAction.fadeAlpha(to: 0, duration: 0.5)
        let FadeIn = SKAction.fadeAlpha(to: 1, duration: 0.5)
        
        //let RepositionDice = SKAction.run {
        //     self.repositionDice(die: currentDie)
        //}
        
        let SetDieFaceImage = SKAction.run {
            self.setDieFaceImage(die: currentDie, currentDieValue: currentDieValue)
        }
        
        let Group = SKAction.group([rollAction, MoveAction])
        //let Group2 = SKAction.group([RepositionDice, SetDieFaceImage])
        
        let Seq = SKAction.sequence([Group, Wait, FadeOut, SetDieFaceImage, FadeIn])
        
        currentDie.position = CGPoint(x: 0, y: 0)
        currentDie.run(Seq)
        
        isComplete(true)
    }

    func repositionDice(die: Die) {
        let currentDie = die
        
        currentDie.zRotation = 0
        currentDie.zPosition = GameConstants.ZPositions.Dice
        currentDie.size = GameConstants.Sizes.Dice

        switch currentDie.name {
        case "Die 1":
            currentDie.position = CGPoint(x: -(gameTable.size.width / 7), y: gameTable.frame.minY + 100)
        case "Die 2":
            currentDie.position = CGPoint(x: die1.position.x + die2.size.width, y: gameTable.frame.minY + 100)
        case "Die 3":
            currentDie.position = CGPoint(x: die2.position.x + die3.size.width, y: gameTable.frame.minY + 100)
        case "Die 4":
            currentDie.position = CGPoint(x: die3.position.x + die4.size.width, y: gameTable.frame.minY + 100)
        case "Die 5":
            currentDie.position = CGPoint(x: die4.position.x + die5.size.width, y: gameTable.frame.minY + 100)
        case "Die 6":
            currentDie.position = CGPoint(x: die5.position.x + die6.size.width, y: gameTable.frame.minY + 100)
        default:
            break
        }
    }
    
    func setDieFaceImage(die: Die, currentDieValue: Int) {
        let currentDie = die
        
        switch currentDieValue {
        case 1:
            currentDie.texture = GameConstants.Textures.Die1
        case 2:
            currentDie.texture = GameConstants.Textures.Die2
        case 3:
            currentDie.texture = GameConstants.Textures.Die3
        case 4:
            currentDie.texture = GameConstants.Textures.Die4
        case 5:
            currentDie.texture = GameConstants.Textures.Die5
        case 6:
            currentDie.texture = GameConstants.Textures.Die6
        default:
            break
        }
    }
}
