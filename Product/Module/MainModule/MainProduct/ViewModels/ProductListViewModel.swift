//
//  ProductListViewModel.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation
import UIKit
protocol viewBindDelegate {
    func pushToView(viewController: UIViewController)
    func reload()
}
/// view model for product list will hides all asynchronous networking code, data preparation code for visual presentation, and code listening for Model changes.  
/// once view model receive response and prepare data it will notify view throught binding and binding function will return a confirmation for viewModelbinding  protocol
class  ProductListViewModel: NSObject {
    // MARK: Varibles
    //private var apiService: NetworkManager?
    // this is the result of bind view with viewModel it's confirmation for viewBindDelegate Protocol
    private var viewBindDelegate: viewBindDelegate?
    // this is object of response model of api call for product
    // when object is init from api respponse the bind between ViewModel and View will done by calling callback function of bind which implemnted in view
    private(set) var productList : [Product]? {
            didSet {
                if let bind = self.bindProductListViewModelToController {
                    viewBindDelegate = bind()
                }
            }
        }
    // this varible will be implemented in the view and this is the bind between viewModel and view
    var bindProductListViewModelToController : (() -> (viewBindDelegate?))?
    
    // MARK: Init Function
    override init() {
        super.init()
       //self.apiService = NetworkManager()
        getProductListApi()
    }
    
    // MARK: Helping Functions
    // Api Call for Movieslist
    func getProductListApi () {
        NetworkServiceLayer.request(router: Router.getProducts) { (result: Result<[String: Product], Error>) in
            switch result {
            case .success(let response):
                self.productList = response.values.map{$0}
                
            case .failure(let error):
                print(result)
            }
        }
    }
}
// MARK: View Event Notifer
extension ProductListViewModel{
    // this function called from view to inform ViewModel that there was selected happend
    func selectProduct (at index: Int)  {
//        if let movies = MoviesArray , movies.count > index {
//            let moviewDetailsViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
//            let movieDetailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel(movie: movies[index], changeDataInArray: self, index: index)
//            moviewDetailsViewController?.movieDetailsViewModel = movieDetailsViewModel
//            // after view model finish logic of get model after selection raw and init view mode and view of details screen it pass it to view to push it by calling delegate which view confirm
//            self.viewBindDelegate?.pushToView(viewController: moviewDetailsViewController ?? UIViewController())
//        }
    }
    func moveToChart (){
        guard let basketView = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BasketView") as? BasketView else {
            return
        }
        self.viewBindDelegate?.pushToView(viewController: basketView)
    }
    func reloadData () {
        self.getProductListApi()
    }
}

