//
//  Menu.swift
//  Farkle
//
//  Created by Mark Davis on 2/5/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//

import SpriteKit
import UIKit

class Menu: SKSpriteNode {
    
    var Name: String = String()
    var ImageName: String = "Casual Game GUI_Window - Wide"
    var Texture = SKTexture(imageNamed: "Casual Game GUI_Window - Wide")
    var Size =  CGSize(width: ((gameScene.size.width) / 2) + 100, height: ((gameScene.size.height) / 2) + 50)
    var Position = CGPoint(x: (gameScene.position.x), y: (gameScene.position.y))
    var ZPosition = 1
    
}
