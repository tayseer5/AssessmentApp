//
//  ProductTableViewCell.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation
import Kingfisher
import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    private var productCellViewModel: ProductCellViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindData(_ productCellViewModel: ProductCellViewModel) {
        self.productCellViewModel = productCellViewModel
        let url = URL(string: productCellViewModel.product.imageUrl)
        movieImageView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "timelapse"),
            options: [
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        movieName.text = productCellViewModel.product.name
    }
    @IBAction func addToChart(_ sender: Any) {
        productCellViewModel?.addToChart()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
