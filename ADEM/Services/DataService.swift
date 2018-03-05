//
//  DataService.swift
//  ADEM
//
//  Created by Coleman Coats on 2/3/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth

//central = [[CBCentralManager alloca], initWithDelegate: self queue: nil options: nil];

class DataService {
	
	static let instance = DataService()
	
	private let item = [
		Product(title: "Eggs", price: "$\(4.94)", imageName: "eggs.jpeg", cal: "Cal. \(340)"),
	]
	
	private let Groceries = [Product]()
	
	func getGroceryOptions() -> [Product] {
		return item
	}
}

//Pull the localName and manufacturing Data out of the advertising data
//NSString *localName = [advertisementData objectForKey:CBAdvertisementDataLocalNameKey];
//NSData   *mfgData   = [advertisementData objectForKey:CBAdvertisementDataManufacturerDataKey];

//class central: CBCentralManager, CBCentralManagerDelegate {
//
//	override init(delegate: CBCentralManagerDelegate?,
//		 queue: DispatchQueue?,
//		 options: [String : Any]? = nil) {
//
//	}
//
//	func centralManager(_ central: CBCentralManager,
//						didDiscover peripheral: CBPeripheral,
//						advertisementData: [String : Any],
//						rssi RSSI: NSNumber) {
//
//	}
//
//
//	func centralManagerDidUpdateState(_ central: CBCentralManager) {
//
//	}
//
//}

