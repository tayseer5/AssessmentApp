//
//  ProductCellViewModel.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//


//import Kingfisher

import Foundation

class  ProductCellViewModel: NSObject {
    // MARK: Varibles
    var product :Product
    var index: Int
    init(product: Product,index: Int ) {
        self.product = product
        self.index = index
        super.init()
    }
    
    func addToChart(){
    }
    
}
