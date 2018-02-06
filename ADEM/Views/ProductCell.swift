//
//  ProductCell.swift
//  ADEM
//
//  Created by Coleman Coats on 1/30/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
	@IBOutlet weak var itemImage: UIImageView!
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var calCount: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	

	func updateViews(product: Product){
		itemImage.image = UIImage(named: product.imageName)
		productName.text = product.title
		calCount.text = product.cal
		productPrice.text = product.price
	}
	
}


