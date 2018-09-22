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
    
    var timer = Timer()

    override func didMove(to view: SKView) {
        let gameSceneBackground = SKSpriteNode(imageNamed: ImageNames.gameSceneBackground)
        gameSceneBackground.anchorPoint = ImageAnchorPoints.gameSceneBackground
        gameSceneBackground.position = ImagePositions.gameSceneBackground
        gameSceneBackground.zPosition = ZPositions.background
        addChild(gameSceneBackground)
        
        // Go to scoreScene after 3 seconds
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(presentPopup), userInfo: nil, repeats: false)
    }
    
    @objc func presentPopup() {
        let popupSize = frame.size * 0.5
        let popup = Popup(size: popupSize)
        popup.zPosition = ZPositions.hudBackground
        popup.position = CGPoint(x: 300, y: 500)
        popup.popupButtonHandlerDelegate = self
        addChild(popup)
    }
}

extension GameScene: PopupButtonHandlerDelegate {
    
    func homeButtonTapped() {
        sceneManagerDelegate?.presentMenuScene()
    }

    func retryButtonTapped() {
        sceneManagerDelegate?.presentGameScene()
    }
}
