//
//  ProductCellViewModel.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation

class  BasketCellViewModel: NSObject {
    // MARK: Varibles
    var shoppingBasket :ShoppingBasket
    var index: Int
    init(shoppingBasket: ShoppingBasket,index: Int ) {
        self.shoppingBasket = shoppingBasket
        self.index = index
        super.init()
    }
    
    func addToChart(){
//        let savedProduct = WARealmManager.shared.getShoppingBasket().filter{
//            ($0.id?.elementsEqual(product.id) ?? false)
//        }
//        if let productObject = savedProduct.first {
//            WARealmManager.shared.updateCountOfProduct(shoppingBasketObject: productObject)
//            
//        } else {
//            let newProductToChart = ShoppingBasket(product: product, count: 1, id: product.id)
//            WARealmManager.shared.addtoShoppingBasketTable(shoppingBasketObject: newProductToChart)
//            
//        }
//        
    }
    
}
