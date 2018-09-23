//
//  GameViewController.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-21.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

protocol SceneManagerDelegate {
    func presentMenuScene()
    func presentGameScene()
    func presentScoreScene(currentScore: Int)
}

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        presentMenuScene()
    }
}

extension GameViewController: SceneManagerDelegate {

    func presentMenuScene() {
        let menuScene = MenuScene(size: view.bounds.size)
        menuScene.sceneManagerDelegate = self
        present(scene: menuScene)
    }
    
    func presentGameScene() {
        let gameScene = GameScene(size: view.bounds.size)
        gameScene.sceneManagerDelegate = self
        present(scene: gameScene)
    }
    
    func presentScoreScene(currentScore: Int) {
        let scoreScene = ScoreScene(size: view.bounds.size)
        scoreScene.currentScore = currentScore
        scoreScene.sceneManagerDelegate = self
        present(scene: scoreScene)
    }
    
    func present(scene: SKScene) {

        if let view = self.view as! SKView? {
            
            // Make sure we start with a fresh scene
            if let gestureRecognizers = view.gestureRecognizers {
                for recognizer in gestureRecognizers {
                    view.removeGestureRecognizer(recognizer)
                }
            }

            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            
            // Debug code
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}
