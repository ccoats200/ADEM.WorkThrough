//
//  PantryVC.swift
//  ADEM
//
//  Created by Coleman Coats on 10/24/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth


class PantryVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	//var centralManager: CBCentralManager!
	
	//Reuse ID's
	
	let profileSection = "Profile"
	let users = "Kitchen Staff"
	let devices = "Devices"
	let restrictions = "Allergies"
	
	//UIElements
	//var connectedLBL = UILabel()
	//var BLESwitch = UISwitch()
	
	
	
	var accountDetails: [accountContent]? = {
		var profile = accountContent()
		//add.itemImageName = "addButton"
		
		//Stuff To be implemented from user
		var profName = accountContent()
		profName.personName = "Coleman"
		
		return [profName]
		
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//navigationItem.title = "Profile"
		
		
		
		let acctText = UILabel()
		acctText.text = "Profile"
		acctText.font = UIFont(name: "Lato", size: 20)
		acctText.textColor = UIColor.rgb(red: 30, green: 188, blue: 29)
		navigationItem.titleView = acctText
		navigationController?.navigationBar.isTranslucent = false
		
		//collectionView?.backgroundColor = UIColor.rgb(red: 30, green: 188, blue: 28)
		
		collectionView?.backgroundColor = UIColor.rgb(red: 241, green: 249, blue: 255)
		
		collectionView?.register(AccountCell.self, forCellWithReuseIdentifier: profileSection)
		collectionView?.register(familyCell.self, forCellWithReuseIdentifier: users)
		
		//This moves the Cells to the correct offsets, Stylistic choice
		collectionView?.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
		collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 50, right: 0)
		
		//bluetooth()
		//BLESwitch.addTarget(self, action: #selector(switchStatus(_:)), for: UIControl.Event.valueChanged)
		
		setUpNavBarButto()
		
	}
	
	func setUpNavBarButto(){
		
		
		let settingsImage = UIBarButtonItem(image: UIImage(named: "Gear")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleSettings))
		
		
		let accountImage = UIBarButtonItem(image: UIImage(named: "AccountIcon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(home))
		
		navigationItem.leftBarButtonItem = accountImage
		navigationItem.rightBarButtonItem = settingsImage
	}
	
	//Account Button
	@objc func home() {
		let bController = CustomCollecCellDesign(collectionViewLayout: UICollectionViewFlowLayout())
		self.navigationController?.pushViewController(bController, animated: true)
		//self.present(bController, animated: true, completion: nil)
		print(123)
	}
	
	//Settings Button
	@objc func handleSettings() {
		
		
		let cController = SettingTVC()
		//let aController = SettingsVC(collectionViewLayout: UICollectionViewFlowLayout())
		self.navigationController?.pushViewController(cController, animated: true)
		print("Settings Tab is active")
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		
		return 1
	}
	
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		
		
		
		return 1
	}
	
	
	
	
	
	//Cell at row
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		//		if indexPath.item == 0
		//		{
		//		let profileCell = collectionView.dequeueReusableCell(withReuseIdentifier: profileSection, for: indexPath) as! AccountCell
		//
		//			return profileCell
		//		} else {
		//
		//		let familyCell = collectionView.dequeueReusableCell(withReuseIdentifier: users, for: indexPath) as! familyCell
		//
		//			return familyCell
		//		}
		
		let profileCell = collectionView.dequeueReusableCell(withReuseIdentifier: profileSection, for: indexPath) as! AccountCell
		
		profileCell.profielItem = accountDetails![indexPath.item]
		
		return profileCell
	}
	/*
	profileCell.backgroundColor = UIColor.rgb(red: 252, green: 252, blue: 252) //off white blue color
	profileCell.layer.cornerRadius = 5
	print("Rounds corners")
	
	
	//Shadow
	profileCell.layer.shadowColor = UIColor.gray.cgColor
	profileCell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
	profileCell.layer.shadowOpacity = 0.7
	profileCell.layer.shadowRadius = 2.0
	profileCell.layer.masksToBounds = false
	profileCell.layer.shadowPath = UIBezierPath(roundedRect: profileCell.bounds, cornerRadius: profileCell.contentView.layer.cornerRadius).cgPath;
	*/
	
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let sizeofAccountCell = CGSize(width: view.frame.width, height: 125)
		return sizeofAccountCell
	}
	
	//Space between rows
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 25
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
}
//
//	//BluetoothStatus
//	@objc func switchStatus(_ sender: UISwitch) {
//		if sender.isOn {
//			connectedLBL.text = "Connected"
//		} else {
//			connectedLBL.text = "Connect"
//		}
//	}
//
//	func bluetooth() {
//
//		//Switch
//		BLESwitch.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
//		BLESwitch.center = CGPoint(x: 163, y: 200)
//		self.view.addSubview(BLESwitch)
//
//		//LBL
//		connectedLBL.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
//		connectedLBL.center = CGPoint(x: 160, y: 285)
//		connectedLBL.textAlignment = .center
//		connectedLBL.text = "Connect"
//		self.view.addSubview(connectedLBL)
//	}


/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


