//
//  GameViewController.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-13.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

protocol SceneManagerDelegate {
    func presentMenuScene()
    func presentLevelScene()
    func presentGameSceneFor(level: Int)
}

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Default first scene is menu
        presentMenuScene()
    }
}

extension GameViewController: SceneManagerDelegate {
    
    /**
     Present menu scene.
     */
    func presentMenuScene() {
        let menuScene = MenuScene()
        menuScene.sceneManagerDelegate = self
        present(scene: menuScene)
    }
    
    /**
     Present level scene.
     */
    func presentLevelScene() {
        let levelScene = LevelScene()
        levelScene.sceneManagerDelegate = self
        present(scene: levelScene)
    }
    
    func presentGameSceneFor(level: Int) {
        let sceneName = "GameScene\(level)"
        if let gameScene = SKScene(fileNamed: sceneName) as? GameScene {
            gameScene.sceneManagerDelegate = self
            print("level \(level)")
            gameScene.level = level
            present(scene: gameScene)
        }
    }
    
    
    /**
     Present a given scene.
     
     - Parameter scene: A new scene to be presented by the view.
     
     ## Important Notes ##
     Remove debug code for production.
     */
    func present(scene: SKScene) {
        if let view = self.view as! SKView? {
            
            // Make sure we start with a fresh scene
            if let gestureRecognizers = view.gestureRecognizers {
                for recognizer in gestureRecognizers {
                    view.removeGestureRecognizer(recognizer)
                }
            }
            
            scene.scaleMode = .resizeFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            
            // Debug code
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}
