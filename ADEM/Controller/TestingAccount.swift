//
//  TestingAccount.swift
//  ADEM
//
//  Created by Coleman Coats on 11/12/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit

//This is an attempt at getting different cells. this is the yelllow red and blue attempt

/*
class AccountVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

	
	//Cell Id's
	let cellId = "CellId"
	let cellId2 = "cell2"
	let cellId3 = "cell3"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white; //just to test
		
		//Image cell
		collectionView.register(Cell.self, forCellWithReuseIdentifier: cellId) //register collection view cell class
		
		//Family Cell
		collectionView.register(Cell2.self, forCellWithReuseIdentifier: cellId2)
		
		//Device Cell
		collectionView.register(Cell3.self, forCellWithReuseIdentifier: cellId3)
		
		
		setupViews(); //setup all views
		
	}
	
	func setupViews() {
		
		view.addSubview(collectionView); // add collection view to view controller
		collectionView.delegate = self; // set delegate
		collectionView.dataSource = self; //set data source
		
		collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true; //set the location of collection view
		collectionView.rightAnchor.constraint(equalTo:  view.rightAnchor).isActive = true; // top anchor of collection view
		collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true; // height
		collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true; // width
		
	}
	
	let collectionView: UICollectionView = { // collection view to be added to view controller
		let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()); //zero size with flow layout
		cv.translatesAutoresizingMaskIntoConstraints = false; //set it to false so that we can suppy constraints
		cv.backgroundColor = .white; // test
		return cv;
	}();
	
	//deque cell
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		//let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath);
		//        cell.backgroundColor = .blue;
		
		switch indexPath.section {
		case 0:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath);
			return cell
			
		case 1:
			let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath)
			return cell2
			
		case 2:
			let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath)
			return cell3
			
		default:
			let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath);
			return cell2
		}
	}
	
	// number of cells
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
			return 1
		}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 6
	}

	//size of each CollecionViewCell
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		switch indexPath.section {
		case 0:
			let size = CGSize(width: view.frame.width/2, height: 100)
			return size
		
		case 1:
			let size1 = CGSize(width: view.frame.width, height: 110)
			return size1
		
		default:
			let defaults = CGSize(width: view.frame.width, height: 110)
			return defaults
		}
	}
}

// first UICollectionViewCell
class Cell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let cellId = "CellId"; // same as above unique id
	
	override init(frame: CGRect) {
		super.init(frame: frame);
		
		setupViews();
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId); //register custom UICollectionViewCell class.
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
		cv.backgroundColor = .yellow; //testing
		cv.layer.cornerRadius = 10
		cv.translatesAutoresizingMaskIntoConstraints = false
		return cv
	}()
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
		cell.backgroundColor = .red
		cell.layer.cornerRadius = 60
		
		return cell
	}
	

	
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
class Cell2: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let cellId2 = "cell2" // same as above unique id
	
	override init(frame: CGRect) {
		super.init(frame: frame);
		
		setupViews();
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId2); //register custom UICollectionViewCell class.
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
		cv.backgroundColor = .yellow; //testing
		cv.layer.cornerRadius = 10
		cv.translatesAutoresizingMaskIntoConstraints = false;
		return cv;
	}()
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath)
			cell.backgroundColor = .red
			cell.layer.cornerRadius = 30
			
			
			return cell
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		
		//return 2
		switch section {
		case 0:
			return 4
		case 1:
			return 4
		default:
			return 2
		}
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
class Cell3: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let cellId3 = "cell3" // same as above unique id
	
	override init(frame: CGRect) {
		super.init(frame: frame);
		
		setupViews();
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId3); //register custom UICollectionViewCell class.
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
		cv.backgroundColor = .yellow; //testing
		cv.layer.cornerRadius = 10
		cv.translatesAutoresizingMaskIntoConstraints = false;
		return cv;
	}()
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath)
		cell.backgroundColor = .blue
		cell.layer.cornerRadius = 60
		
		
		return cell
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		
		//return 2
		switch section {
		case 0:
			return 4
		case 1:
			return 4
		default:
			return 2
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		
		let cell0 = CGSize(width: self.frame.width/4, height: self.frame.height - 10)
		
		return cell0
		
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
*/

