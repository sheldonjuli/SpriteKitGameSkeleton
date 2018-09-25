//
//  MenuScene.swift
//  SpriteKit Game Skeleton
//
//  Created by Li Ju on 2018-09-21.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import SpriteKit
import StoreKit

class MenuScene: SKScene {
    
    var sceneManagerDelegate: SceneManagerDelegate?
    
    var products = [SKProduct]()
    var productId = InAppPurchases.productId
    
    override func didMove(to view: SKView) {
        setupMenu()
        
        SKPaymentQueue.default().add(self)
        getPurchaseInfo()
    } 
    
    func setupMenu() {
        
        let menuSceneBackground = SKSpriteNode(imageNamed: ImageNames.menuSceneBackground)
        menuSceneBackground.anchorPoint = ImageAnchorPoints.menuSceneBackground
        menuSceneBackground.position = ImagePositions.menuSceneBackground
        menuSceneBackground.zPosition = ZPositions.background
        addChild(menuSceneBackground)
        
        let startButton = SpriteKitButton(buttonImage: ImageNames.startButton, action: goToGameScene, caseId: 0)
        startButton.position = CGPoint(x: frame.midX, y: frame.midY * 0.8)
        startButton.aspectScale(to: frame.size, regardingWidth: true, multiplier: AspectScaleMultiplier.startButton)
        startButton.zPosition = ZPositions.hudLabel
        addChild(startButton)
        
        let noAdsButton = SpriteKitButton(buttonImage: ImageNames.noAdsButton, action: goToInAppPurchase, caseId: 0)
        noAdsButton.position = CGPoint(x: frame.maxX - 100, y: frame.maxY - 100)
        noAdsButton.aspectScale(to: frame.size, regardingWidth: true, multiplier: AspectScaleMultiplier.noAdsButton)
        noAdsButton.zPosition = ZPositions.hudLabel
        addChild(noAdsButton)
    }
    
    func goToGameScene(_: Int) {
        sceneManagerDelegate?.presentGameScene()
    }
    
    func goToInAppPurchase(_: Int) {

        guard let productToPurchase = products.filter({$0.productIdentifier == productId}).first else { return }
        let payment = SKPayment(product: productToPurchase)
        SKPaymentQueue.default().add(payment)
        
    }
}

extension MenuScene: SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    func getPurchaseInfo() {
        
        if SKPaymentQueue.canMakePayments() {
            let request = SKProductsRequest(productIdentifiers: NSSet(object: self.productId) as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("In-App purchases unavailabe.")
        }
        
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                print("Purchase successful!")
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                print("Purchase failed!!")
            default:
                print("Purchase not successful!!")
                break
            }
        }
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        products = response.products
        
        if (products.count == 0) {
            print("Product not found.")
        } else {
            print(products[0].localizedTitle)
            print(products[0].localizedDescription)
        }
        
        let invalids = response.invalidProductIdentifiers
        
        for product in invalids {
            print("Product not found: \(product)")
        }
    }
}

