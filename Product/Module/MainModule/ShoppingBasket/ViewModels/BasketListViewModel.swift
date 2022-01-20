//
//  BasketListViewModel.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation
import UIKit

protocol BasketviewBindDelegate {
    func reload()
}
/// view model for product list will hides all asynchronous networking code, data preparation code for visual presentation, and code listening for Model changes.  
/// once view model receive response and prepare data it will notify view throught binding and binding function will return a confirmation for viewModelbinding  protocol
class  BasketListViewModel: NSObject {
    // MARK: Varibles
    //private var apiService: NetworkManager?
    // this is the result of bind view with viewModel it's confirmation for viewBindDelegate Protocol
    private var basketviewBindDelegate: BasketviewBindDelegate?
    // this is object of response model of api call for product
    // when object is init from api respponse the bind between ViewModel and View will done by calling callback function of bind which implemnted in view
    private(set) var shoppingBasket : [ShoppingBasket]? {
            didSet {
                if let bind = self.bindBasketListViewModelToController {
                    basketviewBindDelegate = bind()
                }
            }
        }
    // this varible will be implemented in the view and this is the bind between viewModel and view
    var bindBasketListViewModelToController : (() -> (BasketviewBindDelegate?))?
    
    // MARK: Init Function
    override init() {
        super.init()
       //self.apiService = NetworkManager()
        getBasketList()
    }
    
    // MARK: Helping Functions
    // Api Call for Movieslist
    func getBasketList () {
        shoppingBasket =  WARealmManager.shared.getShoppingBasket()
}
}
// MARK: View Event Notifer
extension BasketListViewModel{
    // this function called from view to inform ViewModel that there was selected happend
    func remove (at index: Int)  {
    }
}

