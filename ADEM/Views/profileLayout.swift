//
//  profileLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 9/27/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit


class AccountCell: CellBasics {
	
	var profielItem: accountContent? {
		didSet {
			accountName.text = profielItem?.personName
			print("set")
		}
	}
	
	let profileImageSection: UIImageView = {
		let profilepic = UIImageView()
		profilepic.image = UIImage(named: "addButton")
		profilepic.contentMode = .center
		//addItemButtonImage.contentMode = .scaleAspectFit
		profilepic.clipsToBounds = true
		profilepic.layer.masksToBounds = true
		print("Created the add button")
		
		return profilepic
	}()
	
	let accountName: UILabel = {
		let accountNameLBL = UILabel()
		accountNameLBL.font = UIFont(name: "Helvetica", size: 20)
		accountNameLBL.font = .boldSystemFont(ofSize: 20)
		accountNameLBL.textColor = UIColor.white
		//accountNameLBL.text = "Coleman"
		accountNameLBL.textAlignment = .center
		//accountNameLBL.layer.cornerRadius = 2
		//accountNameLBL.layer.borderWidth = 0.1
		print("Created the account name Label")
		
		return accountNameLBL
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
		addSubview(profileImageSection)
		addSubview(accountName)
		
		//Vertical
		addConstraintsWithFormats(format: "V:|[v0(110)]|", views: profileImageSection)
		
		
		//Horizontal
		addConstraintsWithFormats(format: "H:|[v0]|", views: profileImageSection)
		addConstraintsWithFormats(format: "H:|[v0]|", views: accountName)
		
		//Top Constraints Quantity
		addConstraint(NSLayoutConstraint(item: accountName, attribute: .top, relatedBy: .equal, toItem: profileImageSection, attribute: .top, multiplier: 1, constant: 5))
		//Right Constraints Quantity
		addConstraint(NSLayoutConstraint(item: accountName, attribute: .right, relatedBy: .equal, toItem: profileImageSection, attribute: .right, multiplier: 1, constant: -5))
		//Height Constraint Quantity
		addConstraint(NSLayoutConstraint(item: accountName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40))
		//Width Constraint
		addConstraint(NSLayoutConstraint(item: accountName, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 100))

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


