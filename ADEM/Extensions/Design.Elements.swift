//
//  Design.Elements.swift
//  ADEM
//
//  Created by Coleman Coats on 7/26/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit

//Color Converter
extension UIColor {
	static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
		return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
	}
}

//Constraints formating
extension UIView {
	func addConstraintsWithFormats(format: String, views: UIView...) {
		var viewsDictionary = [String: UIView]()
		for (index, view) in views.enumerated() {
			let key = "v\(index)"
			view.translatesAutoresizingMaskIntoConstraints = false
			viewsDictionary[key] = view
		}
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
	}
}

