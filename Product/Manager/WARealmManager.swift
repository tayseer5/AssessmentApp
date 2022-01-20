//
//  WARealmManager.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation
import Realm
import RealmSwift

class WARealmManager: NSObject {
    // MARK: - property
    static let shared = WARealmManager()
    private let realm = try? Realm()
    //MARK: Realm CRUDs
    /*
     Saves an object or an array of objects to realm with update, object type needs to have a primary key.
     */
    func saveWithUpdate(model : Object) {
        do {
            try self.realm?.write() {
                realm?.add(model, update: .all)
            }
        }catch{
            
        }
    }
    
    func saveWithUpdateArr(model : [Object]) {
        do {
            try self.realm?.write {
                realm?.add(model, update: .modified)
            }
        }catch{
            
        }
    }
    
    /*
    deletes an object or an array of objects in realm
    */
    func deleteAllinTable(model : Object) {
        do {
//            print(realm?.configuration.fileURL as Any)
            try self.realm?.write {
                realm?.delete(model)
            }
        }catch{
            
        }
    }
    
    func deleteAllinTableArr(model : [Object]) {
        do {
            try self.realm?.write {
                realm?.delete(model)
            }
        }catch{
            
        }
    }
    
    //MARK: CRUD Product
    func getProducts() -> [Product]{
        if let results = self.realm?.objects(Product.self) {
            return Array(results)
        }
        return []
    }
    
    func createProductsTable(productArray:[Product]) {
        self.saveWithUpdateArr(model: productArray)
    }
    
    func addtoProductTable(productObject:Product) {
        self.saveWithUpdate(model: productObject)
    }
    //MARK: CRUD ShoppingBasket
    func getShoppingBasket() -> [ShoppingBasket]{
        if let results = self.realm?.objects(ShoppingBasket.self) {
            return Array(results)
        }
        return []
    }
    
    func createShoppingBasketTable(shoppingBasketArray:[ShoppingBasket]) {
        self.saveWithUpdateArr(model: shoppingBasketArray)
    }
    
    func addtoShoppingBasketTable(shoppingBasketObject:ShoppingBasket) {
        self.saveWithUpdate(model: shoppingBasketObject)
    }
    func updateCountOfProduct(shoppingBasketObject:ShoppingBasket){
        do {
//            print(realm?.configuration.fileURL as Any)
            try self.realm?.write {
                shoppingBasketObject.count = (shoppingBasketObject.count ?? 0) + 1
                //self.saveWithUpdate(model: shoppingBasketObject)
            }
        }catch{
            
        }
    }
}
