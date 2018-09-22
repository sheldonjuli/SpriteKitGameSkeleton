//
//  ScoreScene.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-21.
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
    }
}
