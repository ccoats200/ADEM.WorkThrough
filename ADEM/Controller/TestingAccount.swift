//
//  TestingAccount.swift
//  ADEM
//
//  Created by Coleman Coats on 11/12/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit
import Firebase

//This is an attempt at getting different cells. this is the yelllow red and blue attempt


// first UICollectionViewCell
class userImageSection: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let cellId = "CellId"; // same as above unique id
	
	override init(frame: CGRect) {
		super.init(frame: frame);
		
		setupViews();
		collectionView.register(AccountCell.self, forCellWithReuseIdentifier: cellId); //register custom UICollectionViewCell class.
		// Here I am not using any custom class
		collectionView.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
	}
	
	
	func setupViews(){
		addSubview(collectionView);
		
		collectionView.delegate = self;
		collectionView.dataSource = self;
		
		//collectionView.addConstraintsWithFormats(format: "H:|[v0]|", views: collectionView)
		
		collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
		collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true;
		collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true;
		collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
	}
	
	//Profile Image background
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal //set scroll direction to horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .blue //testing
		cv.layer.cornerRadius = 10

		cv.translatesAutoresizingMaskIntoConstraints = false
		return cv
	}()
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
		//cell.backgroundView = UIImageView(image: profilepic)
		cell.clipsToBounds = true
		
		//cell.layer.cornerRadius = 60
		
		return cell
	}
	
	/*
	let profilepic: UIImage = {
		let pp = UIImage(named: "addButton")!
		print("Created the add button")
		
		return pp
	}()
	*/
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		
		//return 2
		switch section {
		case 0:
			return 1
		case 1:
			return 4
		default:
			return 2
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		switch indexPath.section {
		case 0:
			let cell0 = CGSize(width: self.frame.width, height: self.frame.height - 10)
			
			return cell0
		case 1:
			let cell1 = CGSize(width: 11, height: self.frame.height - 10)
			 return cell1
		default:
			return CGSize(width: self.frame.width, height: self.frame.height - 10)
		}
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


//Second cell
class familySection: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let cellId2 = "cell2" // same as above unique id
	let addFamily = "addFamily"
	
	let famMembers =  ["1","2","3","4"]
	
	override init(frame: CGRect) {
		super.init(frame: frame);
		
		setupViews();
		
		//MARK: Cell configuration at section
		collectionView.register(familyCells.self, forCellWithReuseIdentifier: cellId2)

		// Here I am not using any custom class
		collectionView.contentInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
		
		

		//styling of the cell border
		collectionView.layer.borderWidth = 0.5
		//collectionView.layer.borderColor = CGColor.


	}
	
	
	func setupViews(){
		addSubview(collectionView);
		
		collectionView.delegate = self;
		collectionView.dataSource = self;
		
		collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
		collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true;
		collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true;
		collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
	}
	
	let collectionView: UICollectionView = {
		
		let layout = UICollectionViewFlowLayout();
		layout.scrollDirection = .horizontal; //set scroll direction to horizontal
		
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
		
		//testing
		cv.backgroundColor = .white
		cv.layer.cornerRadius = 10
		cv.translatesAutoresizingMaskIntoConstraints = false;
		return cv
	}()
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		
		
		switch indexPath.row {
		case 0...famMembers.count:
			let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! familyCells
			firstCell.backgroundColor = .blue
			firstCell.layer.cornerRadius = 40
			return firstCell
		
		//MARK: This may not be needed for all the family members cells
		/*
		case 1:
			let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath)
			secondCell.backgroundColor = .blue
			secondCell.layer.cornerRadius = 50
			
			return secondCell
		case 2:
			let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath)
			thirdCell.backgroundColor = .yellow
			thirdCell.layer.cornerRadius = 50
			
			return thirdCell

		case 3:
			let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) //as! familyAddCell
			fourthCell.backgroundColor = .green
			fourthCell.layer.cornerRadius = 50
			
			return fourthCell
*/
		default:
			let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: addFamily, for: indexPath) as! deviceCells
			//fourthCell.backgroundColor = .green
			fourthCell.layer.cornerRadius = 50
			
			return fourthCell
		}
		
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		
	
		let test = famMembers.count
		
		return test
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		
			let cell0 = CGSize(width: self.frame.width/4, height: self.frame.height - 10)
			
			return cell0
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//Third cell
class deviceSection: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let cellId3 = "cell4" // same as above unique id
	

	
//
//	@objc func handleDevice() {
//
//		let cController = SettingsVC()
//		self.navigationController?.pushViewController(cController, animated: true)
//
//		print("Settings Tab is active")
//	}
	

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
		collectionView.register(deviceCells.self, forCellWithReuseIdentifier: cellId3) //register custom UICollectionViewCell class.
		// Here I am not using any custom class
		
		collectionView.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
		
	}
	
	
	
	
	func setupViews(){
		addSubview(collectionView)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
	
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal //set scroll direction to horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .blue //testing
		cv.layer.cornerRadius = 10
		cv.translatesAutoresizingMaskIntoConstraints = false
		return cv
	}()
	
	
	/*
	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		let tappedCell = collectionView.cellForItem(at: indexPath) as! deviceCells
		print(tappedCell.tag)
	}
	*/
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		//let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SettingsVC.connected(_:)))
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath)
		
		
		
		return cell
	}
	
	/*
	//Go to Device Cell
	func connected(_ sender:AnyObject){
		print("you tap image number : \(sender.view.tag)")
		//Your code for navigate to another viewcontroller
	}
	*/
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 4
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let deviceCount = 3
		
		let cell0 = CGSize(width: self.frame.width/CGFloat(deviceCount), height: self.frame.height - 10)
		
		return cell0
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//Fourth cell
class privacySection: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let cellId4 = "cell4" // same as above unique id
	
	override init(frame: CGRect) {
		super.init(frame: frame);
		
		setupViews();
		collectionView.register(BLE.self, forCellWithReuseIdentifier: cellId4) //register custom UICollectionViewCell class.
		// Here I am not using any custom class
		collectionView.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
	}
	
	
	func setupViews(){
		addSubview(collectionView);
		
		collectionView.delegate = self;
		collectionView.dataSource = self;
		
		collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true;
		collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true;
		collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true;
		collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true;
	}
	
	let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout();
		layout.scrollDirection = .horizontal; //set scroll direction to horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout);
		cv.backgroundColor = .blue; //testing
		cv.layer.cornerRadius = 10
		cv.translatesAutoresizingMaskIntoConstraints = false;
		return cv;
	}()
	
	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	
		//let selected = cellId4[collectionView.tag][indexPath.item]
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		//let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SettingsVC.connected(_:)))
		
		
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId4, for: indexPath)
		
		
		//cell.backgroundColor = .blue
		//cell.layer.cornerRadius = 60
		//cell.isUserInteractionEnabled = true
		//cell.tag = indexPath.item
		//cell.addGestureRecognizer(tapGestureRecognizer)
		
		return cell
	}
	
	//Go to Device Cell
	func connected(_ sender:AnyObject){
		print("you tap image number : \(sender.view.tag)")
		//Your code for navigate to another viewcontroller
	}
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let deviceCount = 4
		
		let cell0 = CGSize(width: self.frame.width/CGFloat(deviceCount), height: self.frame.height - 10)
		
		return cell0
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
