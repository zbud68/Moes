//
//  GenericFunctions.swift
//  Farkle
//
//  Created by Mark Davis on 2/24/19.
//  Copyright © 2019 Mark Davis. All rights reserve d.
//
import SpriteKit

extension GameScene {
    
    func intToString(int: Int) -> String {
        let intValue = int
        var stringValue = ""
        
        stringValue = String("\(intValue)")
        
        return stringValue
    }
    
    func evaluateLikeDice (dice: [Die]) -> [Int] {
        var results = [Int]()
        var pointsScored = Int()

        /*
        for die in dice {
            switch die.countThisRoll {
            case 1...2:
                print("no score")
            case 3:
                scoringCombos["3 of a Kind"] = die.faceValue
            case 4:
                scoringCombos["4 of a Kind"] = die.faceValue
            case 5:
                scoringCombos["5 of a Kind"] = die.faceValue
            case 6:
                scoringCombos["6 of a Kind"] = die.faceValue
            default:
                break
            }
        }
         */

        for (key, value) in scoringCombos {
            switch key {
            case "3 of a Kind":
                if value == 1 {
                    pointsScored += value * 10
                } else {
                    pointsScored += value * 100
                }
            case "4 of a Kind":
                pointsScored += value * 100
            case "5 of a Kind":
                pointsScored += value * 100
            case "6 of a kind":
                pointsScored += value * 100
            default:
                break
            }
            results.append(pointsScored)
        }
        print("points scored: \(pointsScored)")
        return results
    }
}


