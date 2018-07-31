////
////  ProductCellContentsLayout.swift
////  ADEM
////
////  Created by Coleman Coats on 6/10/18.
////  Copyright © 2018 Coleman Coats. All rights reserved.
//
//
//
//import Foundation
//import UIKit
//class CustomCollecCellDesign: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//	let cellID = "product"
//
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		navigationItem.title = "List"
//		navigationController?.navigationBar.isTranslucent = false
//
//		collectionView?.backgroundColor = UIColor.white
//
//		collectionView?.register(productCellLayout.self, forCellWithReuseIdentifier: cellID)
//	}
//
//	//Number of cells. update later for collection of cells based on product type
//	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//		//Create the right number of cells for the device
//		return 1
//	}
//
//	//Initiating cell
//	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//		let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
//		productCell.backgroundColor = UIColor.rgb(red: 30, green: 188, blue: 29)
//		productCell.layer.cornerRadius = 5
//
//		print("Rounds corners")
//		return productCell
//	}
//
//	//Size of Cell
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		//let Columns = 3
//
//		//let height = ((view.frame.width/3.2) - 2 - 2) * 9 / 16
//		//		height + 2 + 129
//
//		print("Sets the hight of the cell")
//		return CGSize(width: view.frame.width/3.2, height: 150 ) //25 points go to the product info (150)
//	}
//
//	//Space between rows
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//		return 10
//	}
//
//}


