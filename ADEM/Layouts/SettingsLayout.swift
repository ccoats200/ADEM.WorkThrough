//
//  SettingsLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 4/2/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit

class settingsLayout: UITableViewController {
	
	//CellID
	private let cellID = "Account"
	
	//TableView information
	//	let sectionTitles = ["Personal", "Devices", "Payment"]
	
	//The User profile image should be v1(44)
	
	
	let twoDimArray = [
		["Account", "Health information", "Notifications", "Family"],
		["Bluetooth", "Battery"],
		["Credit Card", "Apple Pay", "Gift Card", "Rewards Card"]
	]
	
	//	var sectionData: [Int: [String]] = [:]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Account"
		navigationItem.rightBarButtonItem = editButtonItem
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
	}
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return twoDimArray[section].count
	}
	
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return twoDimArray.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
		
		let subtitles = twoDimArray[indexPath.section][indexPath.row]
		cell.textLabel?.text = subtitles
		return cell
	}
	
	//	setupViews()
}


//
//
//	let UserProfieView: UIImageView = {
//		let UserImage = UIImageView()
//		UserImage.backgroundColor = UIColor.blue
//		UserImage.translatesAutoresizingMaskIntoConstraints = false
//		return UserImage
//	}()
//
//	func setupViews () {
//		addSubview(UserProfieView)
//
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//
//}
