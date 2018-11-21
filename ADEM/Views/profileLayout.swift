//
//  profileLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 9/27/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit


class AccountCell: CellBasics {

	
	var profielItem: accountContent? {
		
		didSet {
			personName.text = profielItem?.personName
			print("Name is grabed and placed in the person name text box")
		}
	}
	
	let profileImageSection: UIImageView = {
		let profilepic = UIImageView()
		profilepic.image = UIImage(named: "addButton")
		profilepic.contentMode = .center
		//addItemButtonImage.contentMode = .scaleAspectFit
		profilepic.clipsToBounds = true
		profilepic.layer.masksToBounds = true
		print("Created the add button")
		
		return profilepic
	}()
	
	let personName: UILabel = {
		let accountNameLBL = UILabel()
		accountNameLBL.font = UIFont(name: "Helvetica", size: 20)
		accountNameLBL.font = .boldSystemFont(ofSize: 20)
		accountNameLBL.textColor = UIColor.blue
		//accountNameLBL.text = "Coleman"
		accountNameLBL.textAlignment = .center
		//accountNameLBL.layer.cornerRadius = 2
		//accountNameLBL.layer.borderWidth = 0.1
		print("Created the account name Label")
		
		return accountNameLBL
	}()
	
	let nickNAme: UILabel = {
		let NN = UILabel()
		NN.font = UIFont(name: "Helvetica", size: 20)
		NN.font = .boldSystemFont(ofSize: 20)
		NN.textColor = UIColor.blue
		NN.text = "Lazy"
		NN.textAlignment = .center
		//accountNameLBL.layer.cornerRadius = 2
		//accountNameLBL.layer.borderWidth = 0.1
		print("Created the account name Label")
		
		return NN
	}()
	

	
	override func setupViews() {
		addSubview(profileImageSection)
		addSubview(personName)
		
		//Vertical
		addConstraintsWithFormats(format: "V:|[v0(110)]|", views: profileImageSection)
		
		//Horizontal
		addConstraintsWithFormats(format: "H:|[v0]|", views: profileImageSection)
		addConstraintsWithFormats(format: "H:|[v0]|", views: personName)
		
		//Top Constraints Quantity
		addConstraint(NSLayoutConstraint(item: personName, attribute: .top, relatedBy: .equal, toItem: profileImageSection, attribute: .top, multiplier: 1, constant: 5))
		//Right Constraints Quantity
		addConstraint(NSLayoutConstraint(item: personName, attribute: .right, relatedBy: .equal, toItem: profileImageSection, attribute: .right, multiplier: 1, constant: -5))
		//Height Constraint Quantity
		addConstraint(NSLayoutConstraint(item: personName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40))
		//Width Constraint
		addConstraint(NSLayoutConstraint(item: personName, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 100))

	}
}

class familyCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	var products: [itemCellContent]? = {
		var add = itemCellContent()
		//add.itemImageName = "addButton"
		
		var mom = itemCellContent()
		mom.itemName = "Eggs"
		mom.itemImageName = "eggs"
		
		var dad = itemCellContent()
		dad.itemName = "Bread"
		dad.itemImageName = "bread"
		
		var sister = itemCellContent()
		sister.itemName = "Strawberries"
		sister.itemImageName = "eggs"
	
		
		return [mom, dad, sister]
	}()
	
	//reuse ID's
	let cellID = "product"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//fetchItems()

		navigationItem.title = "List"
		
		//Left aligned title
		//let titleTest = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
		let titleText = UILabel()
		titleText.text = "List"
		titleText.font = UIFont(name: "Lato", size: 20)
		//titleText.textColor = UIColor.rgb(red: 30, green: 188, blue: 29)
		titleText.textColor = UIColor.rgb(red: 241, green: 249, blue: 255)
		navigationItem.titleView = titleText
		navigationController?.navigationBar.isTranslucent = false
		
		collectionView?.backgroundColor = UIColor.rgb(red: 241, green: 249, blue: 255)
		
		//collectionView?.backgroundColor = UIColor.rgb(red: 30, green: 188, blue: 28)
		collectionView?.register(productCellLayout.self, forCellWithReuseIdentifier: cellID)
		
		//This moves the Cells to the correct offsets, Stylistic choice
		collectionView?.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
		collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 50, right: 0)
		
		let Columns: CGFloat = 3.0
		let insetDimension: CGFloat = 20.0
		let cellHeight: CGFloat = 125.0
		let cellWidth = (collectionView.frame.width/Columns) - insetDimension
		let layouts = collectionViewLayout as! UICollectionViewFlowLayout
		layouts.itemSize = CGSize(width: cellWidth, height: cellHeight)
		
	}
	
	//Number of cells. update later for collection of cells based on product type
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return products!.count
	}
	
	//Initiating cell
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! productCellLayout
		productCell.backgroundColor = UIColor.rgb(red: 252, green: 252, blue: 252) //off white blue color
		productCell.layer.cornerRadius = 5
		print("Rounds corners")
		
		productCell.gItem = products![indexPath.item]
		
		//collectionview.insertIems(at: indexPaths)
		
		//Shadow
		productCell.layer.shadowColor = UIColor.gray.cgColor
		productCell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
		productCell.layer.shadowOpacity = 0.7
		productCell.layer.shadowRadius = 2.0
		productCell.layer.masksToBounds = false
		productCell.layer.shadowPath = UIBezierPath(roundedRect: productCell.bounds, cornerRadius: productCell.contentView.layer.cornerRadius).cgPath;
		return productCell
	}
	
	//Lets Build that app ep.16
	//	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	//		let Prod = productViewC()
	//		Prod.showProduct()
	//	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("123")
	}
	
	//Space between rows
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 25
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}

class familyCell: CellBasics {

	let kitchenStaff: UIImageView = {
		let Staff = UIImageView()
		Staff.contentMode = .center
		Staff.clipsToBounds = true
		Staff.layer.masksToBounds = true
		Staff.layer.cornerRadius = 10
		Staff.backgroundColor = UIColor.blue

		print("Created the add button")

		return Staff
	}()

	override func setupViews() {
		addSubview(kitchenStaff)

		addConstraintsWithFormats(format: "H:|[v0]|", views: kitchenStaff)
		addConstraintsWithFormats(format: "V:|[v0]|", views: kitchenStaff)
	}
}


