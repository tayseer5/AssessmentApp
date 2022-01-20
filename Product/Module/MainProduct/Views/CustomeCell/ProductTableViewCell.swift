//
//  ProductTableViewCell.swift
//  Product
//
//  Created by Tayseer Anwar on 1/20/22.
//

import Foundation
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
        //ImageLoader().loadImage(with: productCellViewModel.movie.poster_path, image: movieImageView)
        movieName.text = productCellViewModel.product.name 
       // let imageName = productCellViewModel.product.isFavourite ? "heart.fill" :"heart"
        //favouriteButton.setBackgroundImage( UIImage(systemName: imageName), for: UIControl.State.normal)
    }
    @IBAction func addToChart(_ sender: Any) {
        //let imageName = productCellViewModel?.changeFavouriteState() ?? false ? "heart.fill" :"heart"
        
        //favouriteButton.setBackgroundImage( UIImage(systemName: imageName), for: UIControl.State.normal)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
