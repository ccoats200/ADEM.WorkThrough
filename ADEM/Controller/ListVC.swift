//
//  ViewController.swift
//  ADEM
//
//  Created by Coleman Coats on 1/25/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit
import ViewAnimator
import AVFoundation

class ListVC: UIViewController {
	
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
		itemdisplay()
//		if let layout = collectionView?.collectionViewLayout as? AdemLayout {
//			layout.delegate = self
//		}

	}
		
	func itemdisplay() {
	let topDis = 30
	//let leftDis = 30
		let animation = AnimationType.from(direction: .top, offset: CGFloat(topDis))
	view.animate(animations: [animation])
	}

	@IBAction func settings(_ sender: Any) {
		
	}
	
	
	func initProducts() {
		products = DataService.instance.getGroceryOptions()
		print("Did initilize cell")
	}

}




