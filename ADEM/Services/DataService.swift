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
	
	private let item = [
		Product(title: "Eggs", price: "$\(4.94)", imageName: "eggs.jpeg", cal: "Cal. \(340)"),
	]
	
	private let Groceries = [Product]()
	
	func getGroceryOptions() -> [Product] {
		return item
	}
}
