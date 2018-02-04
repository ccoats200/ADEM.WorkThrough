//
//  DataService.swift
//  ADEM
//
//  Created by Coleman Coats on 2/3/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation

class DataService {
	static let instance = DataService()
	
	private let NFCProducts = [
		Product(title: "Eggs", price: "4.94", imageName: "eggs.jpg", cal: "340"),
		Product(title: "Milk", price: "4.00", imageName: "milk.jpg", cal: "500")
	]
	
	private let Groceries = [Product]()
	
	func getGroceryOptions() -> [Product] {
		return NFCProducts
	}
}
