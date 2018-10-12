//
//  profileLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 9/27/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit


class AccountCell: CellBasics {
	
	let profileSection: UIImageView = {
		let profilepic = UIImageView()
		profilepic.image = UIImage(named: "addButton")
		profilepic.contentMode = .center
		//addItemButtonImage.contentMode = .scaleAspectFit
		profilepic.clipsToBounds = true
		profilepic.layer.masksToBounds = true
		print("Created the add button")
		
		return profilepic
	}()
	
	
	let kitchenStaff: UIImageView = {
		let Staff = UIImageView()
		Staff.image = UIImage(named: "eggs")
		Staff.contentMode = .center
		//addItemButtonImage.contentMode = .scaleAspectFit
		Staff.clipsToBounds = true
		Staff.layer.masksToBounds = true
		print("Created the add button")
		
		return Staff
	}()
	
	
	override func setupViews() {
		addSubview(profileSection)
		addSubview(kitchenStaff)
		
		
		addConstraintsWithFormats(format: "H:|[v0]|", views: profileSection)
		addConstraintsWithFormats(format: "V:|-2-[v0(100)]-1-[v1(50)]|", views: profileSection, kitchenStaff)
		
//		//Top Constraints Quantity
//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .top, relatedBy: .equal, toItem: profileSection, attribute: .top, multiplier: 1, constant: 5))
//		//Right Constraints Quantity
//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .right, relatedBy: .equal, toItem: profileSection, attribute: .right, multiplier: 1, constant: -5))
//		//Height Constraint Quantity
//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
//		//Width Constraint
//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 15))
	}
	
	

}


class familyCell: CellBasics {
	
	let kitchenStaff: UIImageView = {
		let Staff = UIImageView()
		Staff.image = UIImage(named: "eggs")
		Staff.contentMode = .center
		//addItemButtonImage.contentMode = .scaleAspectFit
		Staff.clipsToBounds = true
		Staff.layer.masksToBounds = true
		print("Created the add button")
		
		return Staff
	}()
	
	
	override func setupViews() {
		addSubview(kitchenStaff)
		
		
		addConstraintsWithFormats(format: "H:|[v0]|", views: kitchenStaff)
		addConstraintsWithFormats(format: "V:|[v0]|", views: kitchenStaff)
		
		//		//Top Constraints Quantity
		//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .top, relatedBy: .equal, toItem: profileSection, attribute: .top, multiplier: 1, constant: 5))
		//		//Right Constraints Quantity
		//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .right, relatedBy: .equal, toItem: profileSection, attribute: .right, multiplier: 1, constant: -5))
		//		//Height Constraint Quantity
		//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
		//		//Width Constraint
		//		addConstraint(NSLayoutConstraint(item: kitchenStaff, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 15))
	}
	
	
	
}


