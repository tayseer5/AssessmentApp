//
//  Basket.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//
import Foundation
import Realm
import RealmSwift

#warning("Make sure you use codable for decoding data")

class ShoppingBasket: Object, Codable{
    @Persisted  var product: Product?
    @Persisted var count: Int?
    @Persisted(primaryKey: true) var id: String?

    override init() {
    }
    init(product:Product?, count: Int?, id: String?) {
        super.init()
        self.product = product
        self.count = count
        self.id = id
        }
    
}
