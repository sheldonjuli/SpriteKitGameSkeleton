//
//  MenuScene.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-21.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        setupMenu()
    }
    
    func setupMenu() {
        
        let menuSceneBackground = SKSpriteNode(imageNamed: ImageNames.menuSceneBackground)
        menuSceneBackground.anchorPoint = ImageAnchorPoints.menuSceneBackground
        menuSceneBackground.position = ImagePositions.menuSceneBackground
        menuSceneBackground.zPosition = ZPositions.background
        addChild(menuSceneBackground)
        
        let startButton = SpriteKitButton(buttonImage: ImageNames.startButton, action: goToGameScene, caseId: 0)
        startButton.position = CGPoint(x: frame.midX, y: frame.midY * 0.8)
        startButton.aspectScale(to: frame.size, regardingWidth: true, multiplier: AspectScaleMultiplier.startButton)
        startButton.zPosition = ZPositions.hudLabel
        addChild(startButton)
    }
    
    func goToGameScene(_: Int) {
        sceneManagerDelegate?.presentGameScene()
    }
}
