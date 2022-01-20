//
//  MainController.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import UIKit

#warning("""
The initial viewcontroller should show the shopping basket.
It should contain a 'Plus' button for adding new items to the basket.
It should contain a 'Clear' button for removing all items in the basket.
""")


class MainController: UIViewController {

    ///TableView is embedded in the ScrollView.
    ///Set the Size of table view  on the basis of content in it.
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func test(_ sender: Any) {
        callnetwrok()
    }
    func callnetwrok () {
        NetworkServiceLayer.request(router: Router.getProducts) { (result: Result<[String: Product], Error>) in
            switch result {
            case .success(let response):
                let products = response.values.map{$0}
                print(products)
            case .failure(let erroe):
                print(result)
            }
        }
    }

}
