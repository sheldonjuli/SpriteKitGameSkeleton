//
//  ScoreScene.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-23.
//  Copyright © 2018 Li Ju. All rights reserved.
//
import SpriteKit
class ScoreScene: SKScene {
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    override func didMove(to view: SKView) {
        let scoreSceneBackground = SKSpriteNode(imageNamed: ImageNames.scoreSceneBackground)
        scoreSceneBackground.anchorPoint = ImageAnchorPoints.scoreSceneBackground
        scoreSceneBackground.position = ImagePositions.scoreSceneBackground
        scoreSceneBackground.zPosition = ZPositions.background
        addChild(scoreSceneBackground)
        
        presentPopup()
    }
    
    private func presentPopup() {
        let popup = Popup(size: frame.size)
        popup.zPosition = ZPositions.hudBackground
        popup.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        popup.popupButtonHandlerDelegate = self
        addChild(popup)
    }
}

extension ScoreScene: PopupButtonHandlerDelegate {
    
    func homeButtonTapped() {
        sceneManagerDelegate?.presentMenuScene()
    }
    
    func retryButtonTapped() {
        sceneManagerDelegate?.presentGameScene()
    }
}
