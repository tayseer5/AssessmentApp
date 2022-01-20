//
//  ProductListViewController.swift
//  AssessmentApp
//
//  Created by Irfan Saeed on 19/01/2022.
//

import UIKit

#warning("""
The initial viewcontroller should show the shopping basket.
It should contain a 'Plus' button for adding new items to the basket.
It should contain a 'Clear' button for removing all items in the basket.
adjust table view higth by content
add loader 
""")


class ProductListViewController: UIViewController {
    // MARK: IbOutLet
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var noDataView: UIView!
    @IBOutlet weak var tableViewHight: NSLayoutConstraint!
    
    // MARK: varibles
    private var productListViewModel: ProductListViewModel?
    private let refreshControl = UIRefreshControl()
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
        productTableView.delegate = self
        productTableView.dataSource = self
        let productTableViewCell = UINib(nibName: "ProductTableViewCell",
                                  bundle: nil)
        productTableView.register(productTableViewCell , forCellReuseIdentifier: "productCell")
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.pullToRefresh(_:)), for: .valueChanged)
        productTableView.addSubview(refreshControl)
    }
    private func prepareUI () {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .red
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filterIcon.png"), style:.plain, target: self, action: #selector(switchList(_:)))
    }
    // MARK: Helping Function
    //this function from init view model and add callBack function logic from binding btween view and view model which will happend when api response come from webserice
    private func callToViewModelForUIUpdate(){
        self.productListViewModel = ProductListViewModel()
        self.productListViewModel?.bindProductListViewModelToController = {
           // self.tableViewHight.constant = CGFloat(Double(self.productListViewModel?.productList?.count ?? 0 * self.cellHigth))
            //self.productTableView.layoutIfNeeded();
            self.updateDataSource()
            return self
        }
    }
    // this function for notify data source that there was change in data
    private func updateDataSource(){
        if productListViewModel?.productList?.count ?? 0 > 0{
            noDataView.isHidden = true
            self.reload()
        } else {
            noDataView.isHidden = false
        }
    }
    @objc func pullToRefresh(_ sender: AnyObject) {
        productListViewModel?.reloadData()
        self.refreshControl.endRefreshing()
    }
    @IBAction func reGetData(_ sender: Any) {
        productListViewModel?.reloadData()
    }
}

// MARK: extention for TableViewDelegate
extension ProductListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Double(cellHigth))
    }
    
}
// MARK: extention for TableviewDataSource
extension ProductListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productListViewModel?.productList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell
        if let productListViewModel = productListViewModel, let productList =  productListViewModel.productList {
            let  productCellViewModel = ProductCellViewModel(product: productList[indexPath.row], index: indexPath.row)
            //(movie: productList[indexPath.row], changeDataInArray: productListViewModel, index: indexPath.row)
            cell?.bindData(productCellViewModel)
        }
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productListViewModel?.selectProduct(at: indexPath.row)
    }
}

extension ProductListViewController: viewBindDelegate {
    func pushToView(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func reload(){
        productTableView.reloadData()
    }

}
