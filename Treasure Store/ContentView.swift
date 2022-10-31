//
//  ContentView.swift
//  Treasure Store
//
//  Created by Eren Kara on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var storeManager = StoreManager()
    
    var body: some View {
        NavigationView {
            List(storeManager.myProducts, id: \.self) { product in
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.localizedTitle)
                            .font(.headline)
                        
                        Text(product.localizedDescription)
                            .font(.caption2)
                    } // VStack
                    Spacer()
                    if UserDefaults.standard.bool(forKey: product.productIdentifier) {
                        Text("Purchased")
                            .foregroundColor(.green)
                    } else {
                        Button(action: {
                            // Purchase particular IAP product
                            storeManager.purchaseProduct(product: product)
                        }) {
                            Text("Buy for \(product.price)$")
                        }
                        .foregroundColor(.blue)
                    }
                } // HStack
            } // List
            .navigationTitle("Treasure Store ")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Restore products already purchased
                        storeManager.restoreProduct()
                    }) {
                        Text("Restore Purchased")
                    }
                }
            }) // Toolbar
        } // Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storeManager: StoreManager())
    }
}
