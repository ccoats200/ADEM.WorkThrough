//
//  CellLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 9/13/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit

//ADD new product Cell
class addProductCell: CellBasics {
	
	let addItem: UIImageView = {
		let addItemButtonImage = UIImageView()
		addItemButtonImage.image = UIImage(named: "addButton")
		addItemButtonImage.contentMode = .center
		//addItemButtonImage.contentMode = .scaleAspectFit
		addItemButtonImage.clipsToBounds = true
		addItemButtonImage.layer.masksToBounds = true
		print("Created the add button")
		
		return addItemButtonImage
	}()
	
	override func setupViews() {
		addSubview(addItem)
		setUpAddButton()
		
		
		addItem.addGestureRecognizer(UITapGestureRecognizer(target: addProductCell.self, action: #selector(handleAdd)))
		
		addConstraintsWithFormats(format: "H:|[v0]|", views: addItem)
		addConstraintsWithFormats(format: "V:|[v0]|", views: addItem)
	}
	
	func setUpAddButton(){
		print(123)
	}
	
	@objc func handleAdd() {
		print(123)
	}
}

//Product
class productCellLayout: CellBasics {
	
	var gItem: itemCellContent? {
		didSet {
			productImageView.image = UIImage(named: (gItem?.itemImageName)!)
			productName.text = gItem?.itemName
			quantity.text = gItem?.Quantity
			
			
			print("set")
		}
	}
	
	
	let productImageView: UIImageView = {
		let image = UIImageView()
		//image.image = UIImage(named: itemImageName)
		image.contentMode = .scaleAspectFill
		image.clipsToBounds = true
		image.layer.cornerRadius = 5
		image.layer.masksToBounds = true
		print("rounds the corners of the image view")
		return image
	}()
	
	let productName: UILabel = {
		let name = UILabel()
		//name.text = "\(itemName)"
		name.textAlignment = .center
		name.numberOfLines = 1
		name.adjustsFontSizeToFitWidth = true
		print("sets the item name")
		return name
	}()
	
	let quantity: UILabel = {
		let Quant = UILabel()
		//Quant.text = "\(Quantity)"
		print("sets the quantity of the items in the cart")
		Quant.font = UIFont(name: "Helvetica", size: 12)
		Quant.textColor = UIColor.rgb(red: 57, green: 94, blue: 102)
		Quant.translatesAutoresizingMaskIntoConstraints = false
		//Quant.backgroundColor = UIColor.green
		return Quant
	}()
	
	let seperatorView: UIView = {
		let seperator = UIView()
		seperator.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
		print("sets the seperator color")
		return seperator
	}()
	
	override func setupViews() {
		addSubview(productImageView)
		print("adds the product image subview")
		addSubview(seperatorView)
		print("adds the seperator subview")
		addSubview(productName)
		print("adds the product name subview")
		addSubview(quantity)
		print("adds the calorie count subview")
		
		//Horizontral Constaints
		addConstraintsWithFormats(format: "H:|-2-[v0]-2-|", views: productImageView)
		addConstraintsWithFormats(format: "H:|-8-[v0]-8-|", views: productName)
		//addConstraintsWithFormats(format: "H:|-3-[v0]-3-[v1(50)]-8-[v2(40)]", views: productName, price, Quantity)
		
		//Vertical Constraints (productImageView = 105)
		addConstraintsWithFormats(format: "V:|-2-[v0(100)]-1-[v1(20)]-3-[v2(1)]|", views: productImageView, productName, seperatorView)
		//addConstraintsWithFormats(format: "V:|-3-[v0(105)]-4-[v1(20)]-8-[v2(1)]|", views: productImageView, productName, seperatorView)
		
		//Seperator Constaint
		addConstraintsWithFormats(format: "H:|[v0]|", views: seperatorView)
		
		//Constraints: Only use if multiple constraints needed on same view
		
		//Top Constraints Quantity
		addConstraint(NSLayoutConstraint(item: quantity, attribute: .top, relatedBy: .equal, toItem: productImageView, attribute: .top, multiplier: 1, constant: 5))
		//Right Constraints Quantity
		addConstraint(NSLayoutConstraint(item: quantity, attribute: .right, relatedBy: .equal, toItem: productImageView, attribute: .right, multiplier: 1, constant: -5))
		//Height Constraint Quantity
		addConstraint(NSLayoutConstraint(item: quantity, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
		//Width Constraint
		addConstraint(NSLayoutConstraint(item: quantity, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 15))
		
	}
}
