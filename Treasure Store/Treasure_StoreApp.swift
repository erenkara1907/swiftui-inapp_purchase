//
//  Treasure_StoreApp.swift
//  Treasure Store
//
//  Created by Eren Kara on 31.10.2022.
//

import SwiftUI
import StoreKit

@main
struct Treasure_StoreApp: App {
    
    let productIDs = [
        // Use your product IDs instead
        "com.eren.Treasure.Store.IAP.HealingPotion",
        "com.eren.Treasure.Store.IAP.PirateSkin",
        "com.eren.Treasure.Store.IAP.PowerSword"
    ]
    
    @StateObject var storeManager = StoreManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(storeManager: storeManager)
                .onAppear(perform: {
                    SKPaymentQueue.default().add(storeManager)
                    storeManager.getProducts(productIDs: productIDs)
                })
        }
    }
}
