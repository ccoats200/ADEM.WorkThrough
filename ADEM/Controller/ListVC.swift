//
//  ViewController.swift
//  ADEM
//
//  Created by Coleman Coats on 1/25/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit

class ListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	@IBOutlet weak var productsCollection: UICollectionView!
	
	private(set) public var products = [Product]()
	
	//Check out will add a check mark to all items in the list, If you dont want on you uncheck it. at the same time the bottom will raise up to reveal a apple pay logo and the store you want to buy it from. Because you are loged into your rewards program you get the deals and the cash back immediatly.
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		productsCollection.dataSource = self
		productsCollection.delegate = self
		initProducts()
		print("Did load views")
	}
	
	func initProducts() {
		products = DataService.instance.getGroceryOptions()
		print("Did initilize cell")
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print("Did account for sections")
		return products.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
			let product = products[indexPath.row]
			cell.updateViews(product: product)
			print("Did account for cell")
			collectionView.reloadItems(at: [indexPath])
			return cell
		}
		return ProductCell()
		
	}
}

