//
//  ListLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 4/2/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit

class itemCell: UICollectionViewCell {
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	let itemImageView: UIImageView = {
		let itemImage = UIImageView()
		itemImage.backgroundColor = UIColor.blue
		itemImage.translatesAutoresizingMaskIntoConstraints = false
		return itemImage
	}()
	
	let itemCostView: UILabel = {
		let itemCost = UILabel()
		itemCost.backgroundColor = UIColor.blue
		itemCost.translatesAutoresizingMaskIntoConstraints = false
		return itemCost
	}()
	
	let itemNameView: UILabel = {
		let itemName = UILabel()
		itemName.backgroundColor = UIColor.blue
		itemName.translatesAutoresizingMaskIntoConstraints = false
		return itemName
	}()
	
	let itemCalView: UILabel = {
		let itemCal = UILabel()
		itemCal.backgroundColor = UIColor.blue
		itemCal.translatesAutoresizingMaskIntoConstraints = false
		return itemCal
	}()
	
	
	func setupViews () {
		addSubview(itemImageView)
		addSubview(itemCostView)
		addSubview(itemNameView)
		addSubview(itemCalView)
		
	}



required init?(coder aDecoder: NSCoder) {
	fatalError("init(coder:) has not been implemented")
}
	
//
//extension UIView {
//		func addConstraintsWithFormats(format: String, views: UIView...){
//			var viewsDictionary = [String: UIView]()
//			for (index, view) in views.enumerated() {
//				let key = "v\(index)"
//				let value = "h\(view)"
//
//			}
//
//		}
//	}

	
}

