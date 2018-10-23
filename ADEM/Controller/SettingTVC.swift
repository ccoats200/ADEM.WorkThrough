//
//  SettingTVC.swift
//  ADEM
//
//  Created by Coleman Coats on 10/12/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit

class SettingTVC: UITableViewController {

	//reuse ID's
	let privacy = "privacy"

	let settingsOptions = ["Privacy",
						   "Notifications",
						   "General",
						   "Data Download",
						   "Contacts Sync",
						   "Help Center",
						   "Report a Problem"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let setText = UILabel()
		setText.text = "Settings"
		setText.font = UIFont(name: "Lato", size: 20)
		setText.textColor = UIColor.rgb(red: 30, green: 188, blue: 29)
		navigationItem.titleView = setText
		navigationController?.navigationBar.isTranslucent = false
		tableView.backgroundColor = UIColor.rgb(red: 46, green: 114, blue: 111)
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: privacy)
		
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		
		return settingsOptions.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let privacy = tableView.dequeueReusableCell(withIdentifier: self.privacy, for: indexPath)
		privacy.textLabel?.text = settingsOptions[indexPath.row]
		privacy.textLabel?.textAlignment = .center
		privacy.backgroundColor = UIColor.rgb(red: 46, green: 114, blue: 111)
		privacy.textLabel?.font = .boldSystemFont(ofSize: 20)
		privacy.textLabel?.textColor = UIColor.white
		return privacy
	}
	
	
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
}

