//
//  Constants.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-21.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit

struct ImageNames {
    static let menuSceneBackground = "menuSceneBackground"
    static let gameSceneBackground = "gameSceneBackground"
    static let scoreSceneBackground = "scoreSceneBackground"
    
    static let startButton = "startButton"
    static let homeButton = "homeButton"
    static let retryButton = "retryButton"
}

struct ImageAnchorPoints {
    static let menuSceneBackground = CGPoint.zero
    static let gameSceneBackground = CGPoint.zero
    static let scoreSceneBackground = CGPoint.zero
}

struct ImagePositions {
    static let menuSceneBackground = CGPoint.zero
    static let gameSceneBackground = CGPoint.zero
    static let scoreSceneBackground = CGPoint.zero
}

struct ZPositions {
    static let background: CGFloat = 1
    
    // hud elements should have the highest priorities
    static let hudLabel: CGFloat = 10
    static let hudBackground: CGFloat = 11
}
