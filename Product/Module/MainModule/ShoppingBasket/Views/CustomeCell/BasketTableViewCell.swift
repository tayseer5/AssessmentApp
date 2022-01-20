//
//  BasketTableViewCell.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCount: UILabel!
    private var basketCellViewModel: BasketCellViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindData(_ BasketCellViewModel: BasketCellViewModel) {
        self.basketCellViewModel = BasketCellViewModel
        let url = URL(string: basketCellViewModel?.shoppingBasket.product?.imageUrl ?? "")
        productImageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "timelapse"),
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        productName.text = basketCellViewModel?.shoppingBasket.product?.name
        productCount.text = "\(basketCellViewModel?.shoppingBasket.count ?? 0)"
    }
    @IBAction func addToChart(_ sender: Any) {
        basketCellViewModel?.addToChart()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
