//
//  CGSizeExtensions.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-21.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit

extension CGSize {
    
    static public func * (left: CGSize, right: CGFloat) -> CGSize {
        return CGSize(width: left.width * right, height: left.height * right)
    }
    
}
