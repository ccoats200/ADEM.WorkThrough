//
//  Account.swift
//  ADEM
//
//  Created by Coleman Coats on 8/6/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//
//
//import Foundation
//import UIKit
//
//class Settings: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//	
//	let profileID = "Profile"
//	let variables = "KS/D"
//	let safety = "A/I"
//	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		
//		navigationItem.title = "Account"
//		
//		
//		
//	
//	}
//	
//	//Number of cells. update later for collection of cells based on product type
//	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		
//		
//		//Create the right number of cells for the device
//		
//		return 1
//	}
//	
//	//Initiating cell
//	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//		
//		let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellOptions, for: indexPath) as UICollectionViewCell
//		productCell.backgroundColor = UIColor.rgb(red: 252, green: 252, blue: 252) //off white blue color
//		productCell.layer.cornerRadius = 5
//		print("Rounds corners")
//		
//		
//		return productCell
//	}
//	
//	//Size of Cell
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		//let Columns = 3
//		//let height = ((view.frame.width/3.2) - 2 - 2) * 9 / 16
//		//		height + 2 + 129
//		
//		print("Sets the hight of the cell")
//		let sizeofCell = CGSize(width: view.frame.width, height: 125 ) //25 points go to the product info (150)
//		return sizeofCell
//	}
//	
//	
//	//Space between rows
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//		return 15
//	}
//	
//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//		return 0
//	}
//	
//	class accountProfile: CellBasics {
//		
//		let profileImageView: UIImageView = {
//			let profileImage = UIImageView()
//			profileImage.backgroundColor = UIColor.blue
//			print("created image view")
//			return profileImage
//		}()
//		
//		override func setupViews() {
//			addSubview(profileImageView)
//		}
//		
//		
//		
//		
//	}
//	
//	
//	
//}
