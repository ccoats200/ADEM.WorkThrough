//
//  Bluetooth.swift
//  ADEM
//
//  Created by Coleman Coats on 1/31/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit
import Foundation
import CoreBluetooth

extension SettingsVC: CBCentralManagerDelegate {
	func centralManagerDidUpdateState(_ central: CBCentralManager) {
		switch central.state {
		case .unknown:
			print("(central.state is .unknow")
		case .resetting:
			print("(central.state is .resetting")
		case .unsupported:
			print("(central.state is .unsupported")
		case .unauthorized:
			print("(central.state is .unauthorized")
		case .poweredOff:
			print("(central.state is .poweredOff")
		case .poweredOn:
			print("(central.state is .poweredOn")
			centralManager.scanForPeripherals(withServices: nil, options: nil)
		}
	}
	func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
		print(peripheral)
	}
}
