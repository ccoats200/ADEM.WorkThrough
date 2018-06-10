//
//  ProductCellContainerDim.swift
//  ADEM
//
//  Created by Coleman Coats on 6/10/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit

extension ListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		//				let width: CGFloat = 3
		//				let spaceBetweenCells: CGFloat = 1
		//				let height = (collectionView.bounds.width - (width - 1) * spaceBetweenCells) / width
		let width = 120
		let height = 150
		return CGSize(width: width, height: height)
	}
	
	//MARK: Distance Measurments
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	//MARK: Items per section
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print("Did account for sections")
		return products.count
	}
	
	//MARK: Product Cell Contents attributes
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
			let product = products[indexPath.row]
			cell.updateViews(product: product)
			print("Did account for cell")
			collectionView.reloadItems(at: [indexPath])
			return cell
		}
		//		var backgroundColor: UIColor = .blue
		//
		
		return ProductCell()
		
	}
	
	//	func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
	//		<#code#>
	//	}
	//	func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
	//		<#code#>
	//	}
	
	//	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
	//		return
	//	}
	
}


