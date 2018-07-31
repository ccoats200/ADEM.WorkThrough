//
//  ProductCellViewLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 7/26/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
import UIKit

//class productCellLayout: UICollectionViewCell {
//	override init(frame: CGRect) {
//		super.init(frame: frame)
//		setupViews()
//	}
//
//	let productImageView: UIImageView = {
//		let image = UIImageView()
//		image.image = UIImage(named: images)
//		image.contentMode = .scaleAspectFill
//		image.clipsToBounds = true
//		image.layer.cornerRadius = 5
//		image.layer.masksToBounds = true
//		print("rounds the corners of the image view")
//		return image
//	}()
//
//	let productName: UILabel = {
//		let name = UILabel()
//		name.text = "\(itemName)"
//		//name.backgroundColor = UIColor.blue
//		print("sets the item name")
//		return name
//	}()
//
//	let calorieCount: UITextView = {
//		let cal = UITextView()
//		cal.text = "Cal.\(calories)"
//		print("sets the cal count")
//		cal.font = UIFont(name: "Helvetica", size: 12)
//		cal.textColor = UIColor.darkGray
//		cal.translatesAutoresizingMaskIntoConstraints = false
//		cal.backgroundColor = UIColor.clear
//		cal.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
//		print("sets the size of the text")
//		return cal
//	}()
//
//	//MARK:// Use this if The Calories text should be in label format
//	//	let calorieCount: UILabel = {
//	//		let cal = UILabel()
//	//		cal.text = "Cal.\(calories)"
//	//		cal.font = UIFont(name: "Helvetica", size: 12)
//	//		cal.textColor = UIColor.darkGray
//	//		cal.translatesAutoresizingMaskIntoConstraints = false
//	//		//cal.backgroundColor = UIColor.black
//	//		return cal
//	//	}()
//	//
//	let price: UILabel = {
//		let price = UILabel()
//		price.text = "$\(cost)"
//		print("Sets the cost of the item")
//		price.translatesAutoresizingMaskIntoConstraints = false
//		//price.backgroundColor = UIColor.cyan
//		return price
//	}()
//
//	let Quantity: UILabel = {
//		let Quant = UILabel()
//		Quant.text = "Q. \(1)"
//		print("sets the quantity of the items in the cart")
//		Quant.font = UIFont(name: "Helvetica", size: 12)
//		Quant.textColor = UIColor.darkGray
//		Quant.translatesAutoresizingMaskIntoConstraints = false
//		//Quant.backgroundColor = UIColor.green
//		return Quant
//	}()
//
//	let seperatorView: UIView = {
//		let seperator = UIView()
//		seperator.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
//		print("sets the seperator color")
//		return seperator
//	}()
//
//	func setupViews() {
//		addSubview(productImageView)
//		print("adds the product image subview")
//		addSubview(seperatorView)
//		print("adds the seperator subview")
//		addSubview(productName)
//		print("adds the product name subview")
//		addSubview(calorieCount)
//		print("adds the calorie count subview")
//		addSubview(price)
//		print("adds the product price subview")
//		addSubview(Quantity)
//		print("adds the product quantity subview")
//
//		//Horizontral Constaints
//		addConstraintsWithFormats(format: "H:|-2-[v0]-2-|", views: productImageView)
//		addConstraintsWithFormats(format: "H:|-3-[v0]-3-[v1(50)]-8-[v2(40)]", views: productName, price, Quantity)
//
//		//Vertical Constraints
//		addConstraintsWithFormats(format: "V:|-3-[v0(105)]-4-[v1(20)]-8-[v2(1)]|", views: productImageView, productName, seperatorView)
//
//		//Seperator Constaint
//		addConstraintsWithFormats(format: "H:|[v0]|", views: seperatorView)
//
//
//		//Top Constraints Calories
//		addConstraint(NSLayoutConstraint(item: calorieCount, attribute: .top, relatedBy: .equal, toItem: productName, attribute: .bottom, multiplier: 1, constant: 2))
//		//Left Constraints Calories
//		addConstraint(NSLayoutConstraint(item: calorieCount, attribute: .left, relatedBy: .equal, toItem: productName, attribute: .left, multiplier: 1, constant: 0))
//		//Right Constraints Calories
//		addConstraint(NSLayoutConstraint(item: calorieCount, attribute: .right, relatedBy: .equal, toItem: Quantity, attribute: .left, multiplier: 1, constant: 0))
//		//Height Constraint Calories
//		addConstraint(NSLayoutConstraint(item: calorieCount, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
//
//
//		//Top Constraints Price
//		addConstraint(NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: productImageView, attribute: .bottom, multiplier: 1, constant: 4))
//		//Left Constraints Price
//		addConstraint(NSLayoutConstraint(item: price, attribute: .left, relatedBy: .equal, toItem: productName, attribute: .right, multiplier: 1, constant: 8))
//		//Right Constraints Price
//		addConstraint(NSLayoutConstraint(item: price, attribute: .right, relatedBy: .equal, toItem: productImageView, attribute: .right, multiplier: 1, constant: 0))
//		//Height Constraint Price
//		addConstraint(NSLayoutConstraint(item: price, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
//
//
//		//Top Constraints Quantity
//		addConstraint(NSLayoutConstraint(item: Quantity, attribute: .top, relatedBy: .equal, toItem: price, attribute: .bottom, multiplier: 1, constant: 2))
//		//Left Constraints Quantity
//		addConstraint(NSLayoutConstraint(item: Quantity, attribute: .left, relatedBy: .equal, toItem: calorieCount, attribute: .right, multiplier: 1, constant: 8))
//		//Right Constraints Quantity
//		addConstraint(NSLayoutConstraint(item: Quantity, attribute: .right, relatedBy: .equal, toItem: price, attribute: .right, multiplier: 1, constant: 0))
//		//Height Constraint Quantity
//		addConstraint(NSLayoutConstraint(item: Quantity, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
//
//	}
//
//
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//}

