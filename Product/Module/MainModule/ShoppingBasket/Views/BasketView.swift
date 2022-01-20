//
//  BasketView.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation
import UIKit

class BasketView: UIViewController {
    // MARK: IbOutLet
    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var noDataView: UIView!
    
    // MARK: varibles
    private var basketListViewModel: BasketListViewModel?
    let cellHigth = 200
    
    ///TableView is embedded in the ScrollView.
    ///Set the Size of table view  on the basis of content in it.
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustTableView()
        prepareUI()
        callToViewModelForUIUpdate()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    // MARK: UI Handling
    private func adjustTableView() {
        basketTableView.delegate = self
        basketTableView.dataSource = self
        let basketTableViewCell = UINib(nibName: "BasketTableViewCell",
                                  bundle: nil)
        basketTableView.register(basketTableViewCell , forCellReuseIdentifier: "basketCell")
    }
    private func prepareUI () {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .red
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style:.plain, target: self, action: #selector(getChart(_:)))
    }
    // MARK: Helping Function
    //this function from init view model and add callBack function logic from binding btween view and view model which will happend when api response come from webserice
    private func callToViewModelForUIUpdate(){
        self.basketListViewModel = BasketListViewModel()
        self.basketListViewModel?.bindBasketListViewModelToController = {
           // self.tableViewHight.constant = CGFloat(Double(self.productListViewModel?.productList?.count ?? 0 * self.cellHigth))
            //self.productTableView.layoutIfNeeded();
            self.updateDataSource()
            return self
        }
    }
    // this function for notify data source that there was change in data
    private func updateDataSource(){
        if basketListViewModel?.shoppingBasket?.count ?? 0 > 0{
            noDataView.isHidden = true
            self.reload()
        } else {
            noDataView.isHidden = false
        }
    }
}

// MARK: extention for TableViewDelegate
extension BasketView:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Double(cellHigth))
    }
    
}
// MARK: extention for TableviewDataSource
extension BasketView:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketListViewModel?.shoppingBasket?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath) as? BasketTableViewCell
        if let shoppingBasketListViewModel = basketListViewModel, let shoppingBasketList =  shoppingBasketListViewModel.shoppingBasket {
            let  basketCellViewModel = BasketCellViewModel(shoppingBasket: shoppingBasketList[indexPath.row], index: indexPath.row)
            //(movie: productList[indexPath.row], changeDataInArray: productListViewModel, index: indexPath.row)
            cell?.bindData(basketCellViewModel)
        }
        return cell ?? UITableViewCell()
    }
}

extension BasketView: BasketviewBindDelegate {
    func pushToView(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func reload(){
        basketTableView.reloadData()
    }

}
