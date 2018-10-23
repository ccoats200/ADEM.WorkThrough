//
//  ListVC.swift
//  ADEM
//
//  Created by Coleman Coats on 8/2/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit


import Foundation
import UIKit

protocol TapDelegate {
	func selectedProduct(products: itemCellContent)

}

class CustomCollecCellDesign: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	

	
	var products: [itemCellContent]? = {
		var add = itemCellContent()
		//add.itemImageName = "addButton"
		
		
		var eggs = itemCellContent()
		eggs.itemName = "Eggs"
		eggs.itemImageName = "eggs"
		eggs.Quantity = "1"
		
		var Toast = itemCellContent()
		Toast.itemName = "Bread"
		Toast.itemImageName = "bread"
		Toast.Quantity = "5"
		
		var bitch = itemCellContent()
		bitch.itemName = "Strawberries"
		bitch.itemImageName = "eggs"
		bitch.Quantity = "10"
		
		return [eggs, Toast, bitch]
	}()
	
	//reuse ID's
	let cellID = "product"
	let addCellID = "add"
	
	//	func fetchItems() {
	////		let url = NSURL(string: "https://api.wegmans.io/product/products/{sku}")
	////
	////		URLSession.shared.dataTask(with: url!) { (data, response, error) in
	////			if error != nil {
	////				print(error)
	////				return
	////			}
	////
	////			let json = JSONSerialization
	////			let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
	////			print(str)
	////		}.resume()
	//
	//		//let params = ["username":"john", "password":"123456"] as Dictionary<String, String>
	//
	//		//var request = URLRequest(url: (URL(string: "https://api.wegmans.io/product/products/{sku}")!))
	//
	//		var request = URLRequest(url: (URL(string: "https://adem-cfb8f.firebaseio.com/")!))
	//
	//		request.httpMethod = "GET"
	//		request.httpBody = try? JSONSerialization.data(withJSONObject: itemCellContent(), options: [])
	//		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
	//
	//		let session = URLSession.shared
	//		let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
	//			print(response!)
	//			do {
	//				let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
	//				print(json)
	//			} catch {
	//				print("error")
	//			}
	//		})
	//
	//		task.resume()
	//
	//	}

	
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
		collectionView?.register(addProductCell.self, forCellWithReuseIdentifier: addCellID)
		
		collectionView?.register(productCellLayout.self, forCellWithReuseIdentifier: cellID)
		
		//This moves the Cells to the correct offsets, Stylistic choice
		collectionView?.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
		collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 50, right: 0)
		
		setUpTabBar()
		setUpNavBarButton()
		
		let Columns: CGFloat = 3.0
		let insetDimension: CGFloat = 20.0
		let cellHeight: CGFloat = 125.0
		let cellWidth = (collectionView.frame.width/Columns) - insetDimension
		let layouts = collectionViewLayout as! UICollectionViewFlowLayout
		layouts.itemSize = CGSize(width: cellWidth, height: cellHeight)
		
	}
	
	func setUpNavBarButton() {
		let accountImage = UIBarButtonItem(image: UIImage(named: "account")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAccount))
		
		
		navigationItem.leftBarButtonItem = accountImage
		
	}
	
	//Account Button
	@objc func handleAccount() {
		
		let aController = AccountVC(collectionViewLayout: UICollectionViewFlowLayout())
		self.navigationController?.pushViewController(aController, animated: true)
		//self.present(aController, animated: true, completion: nil)
		print("Acccount tab is active")
	}
	
	
	@objc func handleProduct() {

		let cController = ProductVC(collectionViewLayout: UICollectionViewFlowLayout())
		self.navigationController?.pushViewController(cController, animated: true)
		print("Settings Tab is active")
	}
	
	@objc func handleSearch() {
		
		let cController = ProductVC(collectionViewLayout: UICollectionViewFlowLayout())
		self.navigationController?.pushViewController(cController, animated: true)
		print("Settings Tab is active")
	}
	
	let tabBar: TabBar = {
		let tB = TabBar()
		return tB
		//This needs to be fixed so it doesn't scroll
	}()
	
	private func setUpTabBar() {
		view.addSubview(tabBar)
		
		view.addConstraintsWithFormats(format: "H:|[v0]|", views: tabBar)
		view.addConstraintsWithFormats(format: "V:[v0(70)]|", views: tabBar)
	}
	
	//Number of cells. update later for collection of cells based on product type
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if let _ = products {
			return products!.count + 1
			//return (products?.count)! + 1
		}
		return 1
	}
	
	//Initiating cell
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if indexPath.item == 0
		{
			let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: addCellID, for: indexPath) as! addProductCell
			//New item
			
				
			print("Rounds corners")
			
			return newCell
		} else {
			let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! productCellLayout
			productCell.backgroundColor = UIColor.rgb(red: 252, green: 252, blue: 252) //off white blue color
			productCell.layer.cornerRadius = 5
			print("Rounds corners")
			
			productCell.gItem = products![indexPath.item - 1]
			
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
	}
	
	
	//Lets Build that app ep.16
//	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		let Prod = productViewC()
//		Prod.showProduct()
//	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		_ = addProductCell.self

		_ = 0
		handleProduct()
		print("123")
	}
	
	
	/*
	//Size of Cell
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let Columns: CGFloat = 3.0
		//let height = ((view.frame.width/3.2) - 2 - 2) * 9 / 16
		//height + 2 + 129
		print("Sets the hight of the cell")
		
		
		
		
		
		//let cellWidth = collectionView.bounds.width/3.6
		//let cellHeight: CGFloat = 125
		
		
		//let widths = self.view.frame.width
		//view.frame.width / 3.6
	
		//let sizeofCell = CGSize(width: cellWidth, height: cellHeight) //25 points go to the product info (150)
		return sizeofCell
	}
	*/
	
	//Space between rows
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 25
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
}
