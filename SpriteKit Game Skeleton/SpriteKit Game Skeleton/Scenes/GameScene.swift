//
//  GameScene.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-21.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    // Game over if lifeInt < 1
    private var lifeInt = 1
    private var timer = Timer()

    override func didMove(to view: SKView) {
        let gameSceneBackground = SKSpriteNode(imageNamed: ImageNames.gameSceneBackground)
        gameSceneBackground.anchorPoint = ImageAnchorPoints.gameSceneBackground
        gameSceneBackground.position = ImagePositions.gameSceneBackground
        gameSceneBackground.zPosition = ZPositions.background
        addChild(gameSceneBackground)
        
        // Counts every second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startGameTimer), userInfo: nil, repeats: true)
    }
    
    @objc func startGameTimer() {
        lifeInt -= 1
        if lifeInt < 1 {
            timer.invalidate()
            sceneManagerDelegate?.presentScoreScene()
        }
    }
}
