//
//  Menus_Ext.swift
//  Farkle
//
//  Created by Mark Davis on 2/20/19.
//  Copyright © 2019 Mark Davis. All rights reserved.
//
import SpriteKit

extension GameScene {
    
    func setupMainMenuIcons() {
        
        newGameIcon.texture = SKTexture(imageNamed: "GreenPlay")
        newGameIcon.name = "New Game"
        newGameIcon.size = CGSize(width: 32, height: 32)
        newGameIcon.zPosition = GameConstants.ZPositions.Icon
        newGameIcon.position = CGPoint(x: -50, y: mainMenu.frame.midY + 40)
        
        resumeIcon.texture = SKTexture(imageNamed: "GreenReload")
        resumeIcon.name = "Continue"
        resumeIcon.size = CGSize(width: 32, height: 32)
        resumeIcon.zPosition = GameConstants.ZPositions.Icon
        resumeIcon.position = CGPoint(x: -50, y: mainMenu.frame.midY)
        
        settingsIcon.texture = SKTexture(imageNamed: "GreenSettings")
        settingsIcon.name = "Settings"
        settingsIcon.size = CGSize(width: 32, height: 32)
        settingsIcon.zPosition = GameConstants.ZPositions.Icon
        settingsIcon.position = CGPoint(x: -50, y: mainMenu.frame.midY - 40)
        
        exitIcon.texture = SKTexture(imageNamed: "GreenExit")
        exitIcon.name = "Exit"
        exitIcon.size = CGSize(width: 32, height: 32)
        exitIcon.zPosition = GameConstants.ZPositions.Icon
        exitIcon.position = CGPoint(x: -50, y: mainMenu.frame.midY - 80)
        
        infoIcon.texture = SKTexture(imageNamed: "GreenInfo")
        infoIcon.name = "Info"
        infoIcon.size = CGSize(width: 24, height: 24)
        infoIcon.position = CGPoint(x: mainMenu.frame.maxX - 50, y: mainMenu.frame.minY + 35)
        infoIcon.zPosition = GameConstants.ZPositions.Icon
        
        setupMainMenuLabels()
        setupMainMenuIconsArray()
        addMainMenu()
    }
    
    func setupMainMenuLabels() {
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.fontName = GameConstants.StringConstants.FontName
        mainMenuLabel.fontSize = GameConstants.Sizes.MainMenuFont
        mainMenuLabel.fontColor = GameConstants.Colors.MainMenuFont
        mainMenuLabel.zPosition = GameConstants.ZPositions.MenuLabel
        mainMenuLabel.position = CGPoint(x: 0, y: mainMenu.frame.maxY - (mainMenuLabel.fontSize + (mainMenuLabel.fontSize / 3)))
        
        newGameIconLabel.text = "New Game"
        newGameIconLabel.fontName = GameConstants.StringConstants.FontName
        newGameIconLabel.fontSize = GameConstants.Sizes.IconLabelFont
        newGameIconLabel.fontColor = GameConstants.Colors.IconLabelFont
        newGameIconLabel.zPosition = GameConstants.ZPositions.IconLabel
        newGameIconLabel.position = CGPoint(x: 65, y: -8)
        
        resumeIconLabel.text = "Continue"
        resumeIconLabel.fontName = GameConstants.StringConstants.FontName
        resumeIconLabel.fontSize = GameConstants.Sizes.IconLabelFont
        resumeIconLabel.fontColor = GameConstants.Colors.IconLabelFont
        resumeIconLabel.zPosition = GameConstants.ZPositions.IconLabel
        resumeIconLabel.position = CGPoint(x: 59, y: -8)
        
        settingsIconLabel.text = "Settings"
        settingsIconLabel.fontName = GameConstants.StringConstants.FontName
        settingsIconLabel.fontSize = GameConstants.Sizes.IconLabelFont
        settingsIconLabel.fontColor = GameConstants.Colors.IconLabelFont
        settingsIconLabel.zPosition = GameConstants.ZPositions.IconLabel
        settingsIconLabel.position = CGPoint(x: 58, y: -8)
        
        exitIconLabel.text = "Exit Game"
        exitIconLabel.fontName = GameConstants.StringConstants.FontName
        exitIconLabel.fontSize = GameConstants.Sizes.IconLabelFont
        exitIconLabel.fontColor = GameConstants.Colors.IconLabelFont
        exitIconLabel.zPosition = GameConstants.ZPositions.IconLabel
        exitIconLabel.position = CGPoint(x: 67, y: -8)
    }
    
    func setupSettingsMenuIcons() {
        
        soundIcon.texture = SKTexture(imageNamed: "GreenSound")
        soundIcon.name = "Sound"
        soundIcon.size = CGSize(width: 32, height: 32)
        soundIcon.zPosition = GameConstants.ZPositions.Icon
        soundIcon.position = CGPoint(x: -50, y: settingsMenu.frame.midY + 40)
        
        backIcon.texture = SKTexture(imageNamed: "GreenLeftArrow")
        backIcon.name = "Back"
        backIcon.size = CGSize(width: 32, height: 32)
        backIcon.zPosition = GameConstants.ZPositions.Icon
        backIcon.position = CGPoint(x: -50, y: settingsMenu.frame.midY)
        
        setupSettingsMenuLabels()
        setupSettingsMenuIconsArray()
    }
    
    func setupSettingsMenuLabels() {
        settingsMenuLabel.text = "Settings Menu"
        settingsMenuLabel.fontName = GameConstants.StringConstants.FontName
        settingsMenuLabel.fontSize = GameConstants.Sizes.MainMenuFont
        settingsMenuLabel.fontColor = GameConstants.Colors.MainMenuFont
        settingsMenuLabel.zPosition = GameConstants.ZPositions.MenuLabel
        settingsMenuLabel.position = CGPoint(x: 0, y: settingsMenu.frame.maxY - (settingsMenuLabel.fontSize + (settingsMenuLabel.fontSize / 3)))
        soundIconLabel.text = "Sound"
        soundIconLabel.fontName = GameConstants.StringConstants.FontName
        soundIconLabel.fontSize = GameConstants.Sizes.IconLabelFont
        soundIconLabel.fontColor = GameConstants.Colors.IconLabelFont
        soundIconLabel.zPosition = GameConstants.ZPositions.IconLabel
        soundIconLabel.position = CGPoint(x: 65, y: -8)
        
        backIconLabel.text = "Back"
        backIconLabel.fontName = GameConstants.StringConstants.FontName
        backIconLabel.fontSize = GameConstants.Sizes.IconLabelFont
        backIconLabel.fontColor = GameConstants.Colors.IconLabelFont
        backIconLabel.zPosition = GameConstants.ZPositions.IconLabel
        backIconLabel.position = CGPoint(x: 59, y: -8)
    }
    
    func addMainMenu() {
        
        self.addChild(mainMenu)
        mainMenu.addChild(newGameIcon)
        mainMenu.addChild(resumeIcon)
        mainMenu.addChild(settingsIcon)
        mainMenu.addChild(exitIcon)
        mainMenu.addChild(infoIcon)
        mainMenu.addChild(mainMenuLabel)
        newGameIcon.addChild(newGameIconLabel)
        resumeIcon.addChild(resumeIconLabel)
        settingsIcon.addChild(settingsIconLabel)
        exitIcon.addChild(exitIconLabel)
    }
    
    func addSettingsMenu() {
        self.addChild(settingsMenu)
        settingsMenu.addChild(settingsMenuLabel)
        settingsMenu.addChild(soundIcon)
        soundIcon.addChild(soundIconLabel)
        settingsMenu.addChild(backIcon)
        backIcon.addChild(backIconLabel)
    }
}
