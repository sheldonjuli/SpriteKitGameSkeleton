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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(presentPopup), userInfo: nil, repeats: false)
    }
    
    @objc func presentPopup() {
        let popup = Popup(size: frame.size)
        popup.zPosition = ZPositions.hudBackground
        popup.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
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
