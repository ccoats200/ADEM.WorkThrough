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
	
	private let itemOptions = [
		Product(title: "Eggs", price: "4.94", imageName: "eggs.jpg", cal: "340")
	]
	
	
	private let Grocery = [Product]()
	
	func getGroceryOptions() -> [Product] {
		return itemOptions
	}
}
