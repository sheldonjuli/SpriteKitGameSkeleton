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
        
        setupMenu(view: view)
        print(view.bounds)
    
        SKPaymentQueue.default().add(self)
        getPurchaseInfo()
    } 
    
    func setupMenu(view: SKView) {
        
        let menuSceneBackground = SpriteKitSceneBackground(view: view, backgroundImageName: ImageNames.menuSceneBackground)
        addChild(menuSceneBackground)

        let noAdsButton = SpriteKitButton(buttonImage: ImageNames.noAdsButton, action: goToInAppPurchase, caseId: 0)
        noAdsButton.position = view.noAdsButtonPosition
        noAdsButton.aspectScale(to: view.bounds.size, regardingWidth: true, multiplier: AspectScaleMultiplier.noAdsButton)
        noAdsButton.zPosition = ZPositions.hudLabel
        addChild(noAdsButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        goToGameScene()
    }
    
    func goToGameScene() {
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

