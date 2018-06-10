//
//  ProductCellContentsLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 6/10/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.


import Foundation
import UIKit

//
//class CustomCollecCellDesign: ListVC {
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		collectionView?.backgroundColor = UIColor.blue
//	}
//	
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		//				let width: CGFloat = 3
//		//				let spaceBetweenCells: CGFloat = 1
//		//				let height = (collectionView.bounds.width - (width - 1) * spaceBetweenCells) / width
//		let width = 120
//		let height = 150
//		return CGSize(width: width, height: height)
//	}
//	
//	//MARK: Distance Measurments
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//		return 0
//	}
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//		return 0
//	}
//	
//	//MARK: Items per section
//	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		print("Did account for sections")
//		return products.count
//	}
//	
//	//MARK: Product Cell Contents attributes
//	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//		
//		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
//			let product = products[indexPath.row]
//			cell.updateViews(product: product)
//			print("Did account for cell")
//			collectionView.reloadItems(at: [indexPath])
//			return cell
//		}
//		//		var backgroundColor: UIColor = .blue
//		//
//		
//		return ProductCell()
//		
//	}
//	
//	//	func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
//	//		<#code#>
//	//	}
//	//	func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//	//		<#code#>
//	//	}
//	
//	//	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//	//		return
//	//	}
//	
//}
//
//class codedProductCell: UICollectionViewCell {
//
//	
//	override init(frame: CGRect) {
//		super.init(frame: frame)
//		setupViews()
//	}
//	
//	let itemImageView: UIImageView = {
//		let itemImage = UIImageView()
//		itemImage.backgroundColor = UIColor.blue
//		itemImage.translatesAutoresizingMaskIntoConstraints = false
//		return itemImage
//	}()
//	
//	let itemCostView: UILabel = {
//		let itemCost = UILabel()
//		itemCost.backgroundColor = UIColor.blue
//		itemCost.translatesAutoresizingMaskIntoConstraints = false
//		return itemCost
//	}()
//	
//	let itemNameView: UILabel = {
//		let itemName = UILabel()
//		itemName.backgroundColor = UIColor.blue
//		itemName.translatesAutoresizingMaskIntoConstraints = false
//		return itemName
//	}()
//	
//	let itemCalView: UILabel = {
//		let itemCal = UILabel()
//		itemCal.backgroundColor = UIColor.blue
//		itemCal.translatesAutoresizingMaskIntoConstraints = false
//		return itemCal
//	}()
//	
//	
//	func setupViews() {
//		addSubview(itemImageView)
//		addSubview(itemCostView)
//		addSubview(itemNameView)
//		addSubview(itemCalView)
//		
//	}
//	
//	
//	
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//}
//
//extension UIView {
//	func addConstraintsWithFormat(format: String, views: UIView...){
//		var viewsDictionary = [String: UIView]()
//		for (index, view) in views.enumerated() {
//			let key = "v\(index)"
//			viewsDictionary[key] = view
//		}
//	}
//}
