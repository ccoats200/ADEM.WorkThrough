//
//  Product.swift
//  ADEM
//
//  Created by Coleman Coats on 2/3/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation

struct Product {
	private(set) public var title: String
	private(set) public var price: String
	private(set) public var imageName: String
	private(set) public var cal: String
	
	init(title: String, price: String, imageName: String, cal: String) {
		self.title = title
		self.price = price
		self.imageName = imageName
		self.cal = cal
	}
}


