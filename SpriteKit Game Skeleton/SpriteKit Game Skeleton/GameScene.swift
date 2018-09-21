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

    override func didMove(to view: SKView) {
        let gameSceneBackground = SKSpriteNode(imageNamed: ImageNames.gameSceneBackground)
        gameSceneBackground.anchorPoint = ImageAnchorPoints.gameSceneBackground
        gameSceneBackground.position = ImagePositions.gameSceneBackground
        addChild(gameSceneBackground)
    }
}
