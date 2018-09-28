//
//  tabBar.swift
//  ADEM
//
//  Created by Coleman Coats on 8/2/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//


import UIKit

class TabBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let buttonCellID = "buttonCell"
	let tabBarButtonNames = ["Home", "Pantry", "addButton", "Home"]
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		
		tabBarButtons.register(tabCell.self, forCellWithReuseIdentifier: buttonCellID)
		
		addSubview(tabBarButtons)
		addConstraintsWithFormats(format: "H:|[v0]|", views: tabBarButtons)
		addConstraintsWithFormats(format: "V:|[v0]|", views: tabBarButtons)
		let selectedItemIndexPath = NSIndexPath(item: 0, section: 0)
		tabBarButtons.selectItem(at: selectedItemIndexPath as IndexPath, animated: false, scrollPosition: .top)
		
	}
	
	
	lazy var tabBarButtons: UICollectionView = {
		let TBBSLayout = UICollectionViewFlowLayout()
		let TBBS = UICollectionView(frame: .zero, collectionViewLayout: TBBSLayout)
		TBBS.backgroundColor = UIColor.rgb(red: 253, green: 254, blue: 255)
		TBBS.dataSource = self
		TBBS.delegate = self
		
		return TBBS
		
	}()
	
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print("makes 4 cells")
		return 4
		
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let buttonCell = collectionView.dequeueReusableCell(withReuseIdentifier: buttonCellID, for: indexPath) as! tabCell
		
		buttonCell.tabButtonView.image = UIImage(named: tabBarButtonNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
		buttonCell.tintColor = UIColor.rgb(red: 54, green: 147, blue: 111)
		
		return buttonCell
		
		
		
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: frame.width / 4, height: frame.height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

class tabCell: CellBasics {
	
	let tabButtonView: UIImageView = {
		let TBV = UIImageView()
		TBV.image = UIImage(named: "Home")?.withRenderingMode(.alwaysTemplate)
		TBV.tintColor = UIColor.rgb(red: 54, green: 147, blue: 111)
		return TBV
	}()
	
	override var isHighlighted: Bool {
		didSet {
			tabButtonView.tintColor = isHighlighted ? UIColor.rgb(red: 59, green: 125, blue: 121) : UIColor.rgb(red: 54, green: 147, blue: 111)
			print("Tab bar item is selected")
		}
	}
	
	override var isSelected : Bool {
		didSet {
			tabButtonView.tintColor = isSelected  ? UIColor.rgb(red: 59, green: 125, blue: 121) : UIColor.rgb(red: 54, green: 147, blue: 111)
			print("Tab bar item is selected")
		}
	}
	
	
	override func setupViews() {
		super.setupViews()
		
		addSubview(tabButtonView)
		
		addConstraintsWithFormats(format: "H:[v0(28)]", views: tabButtonView)
		addConstraintsWithFormats(format: "V:[v0(28)]", views: tabButtonView)
		
		addConstraint(NSLayoutConstraint(item: tabButtonView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		addConstraint(NSLayoutConstraint(item: tabButtonView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
	}
	
}
