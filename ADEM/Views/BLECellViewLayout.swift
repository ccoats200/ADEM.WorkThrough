//
//  BLECellViewLayout.swift
//  ADEM
//
//  Created by Coleman Coats on 11/28/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

/*

import Foundation
import UIKit
import CoreBluetooth

// STEP 0.0: specify GATT "Assigned Numbers" as
// constants so they're readable and updatable

// MARK: - Core Bluetooth service IDs
let BLE_RFID_CBUUID = CBUUID(string: "0x1825")

// MARK: - Core Bluetooth characteristic IDs
let BLE_OTS_Feature_Characteristic_CBUUID = CBUUID(string: "0x2ABD")
let BLE_ObjectName_Characteristic_CBUUID = CBUUID(string: "0x2ABE")
let BLE_ObjectType_Characteristic_CBUUID = CBUUID(string: "0x2ABF")
let BLE_ObjectSize_Characteristic_CBUUID = CBUUID(string: "0x2AC0")
let BLE_ObjectFirstCreated_Characteristic_CBUUID = CBUUID(string: "0x2AC1")
let BLE_ObjectLastModified_Characteristic_CBUUID = CBUUID(string: "0x2AC2")
let BLE_ObjectID_Characteristic_CBUUID = CBUUID(string: "0x2AC3")
let BLE_ObjectProperties_Characteristic_CBUUID = CBUUID(string: "0x2AC4")
let BLE_Object_Action_Control_Point_Characteristic_CBUUID = CBUUID(string: "0x2AC5")
let BLE_ObjectListControlPoint_Characteristic_CBUUID = CBUUID(string: "0x2AC6")
let BLE_ObjectListFilter_Characteristic_CBUUID = CBUUID(string: "0x2AC7")
let BLE_ObjectChanged_Characteristic_CBUUID = CBUUID(string: "0x2AC8")




//Object Transfer error codes
let writeRequestRejected = CBUUID(string: "0x80")
let objectAlreadtExistCode = CBUUID(string: "0x83")
let objectNotSelectedCode = CBUUID(string: "0x81")
let objectConcurrencyLimitExceeded = CBUUID(string: "0x82")




// STEP 0.1: this class adopts both the central and peripheral delegates
// and therefore must conform to these protocols' requirements
class BLECell: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
	
	// MARK: - Core Bluetooth class member variables
	
	// STEP 0.2: create instance variables of the
	// CBCentralManager and CBPeripheral so they
	// persist for the duration of the app's life
	var centralManager: CBCentralManager?
	var peripheralRfidReader: CBPeripheral?
	
	// MARK: - UI outlets / member variables
	
	var connectedLBL = UILabel()
	var BLESwitch = UISwitch()
	var DeviceLBL = UILabel()
	var connectionStatusView = UIView()
	var connectingActivityIndicator = UIActivityIndicatorView()
	var brandNameTextField = UITextField()
	var sensorLocationTextField = UITextField()
	var itemNameLabel = UILabel()
	var bluetoothOffLabel = UILabel()
	
	// HealthKit setup
	//let healthKitInterface = HealthKitInterface()
	
	// MARK: - UIViewController delegate
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// initially, we're scanning and not connected
		connectingActivityIndicator.backgroundColor = UIColor.red
		connectingActivityIndicator.startAnimating()
		connectionStatusView.backgroundColor = UIColor.red
		brandNameTextField.text = "show"
		sensorLocationTextField.text = "shows"
		itemNameLabel.text = "showed"
		// just in case Bluetooth is turned off
		bluetoothOffLabel.alpha = 0.0
		
		view.backgroundColor = UIColor.orange
		
		// STEP 1: create a concurrent background queue for the central
		let centralQueue: DispatchQueue = DispatchQueue(label: "com.iosbrain.centralQueueName", attributes: .concurrent)
		// STEP 2: create a central to scan for, connect to,
		// manage, and collect data from peripherals
		centralManager = CBCentralManager(delegate: self, queue: centralQueue)
		
		// read heart rate data from HKHealthStore
		// healthKitInterface.readHeartRateData()
		
		// read gender type from HKHealthStore
		// healthKitInterface.readGenderType()
		
		bluetooth()
		BLESwitch.addTarget(self, action: #selector(switchStatus(_:)), for: UIControl.Event.valueChanged)
	}
	
	//BluetoothStatus
	@objc func switchStatus(_ sender: UISwitch) {
		
		switch sender.isOn {
		case true:
			connectedLBL.text = "Connected"
		default:
			connectedLBL.text = "Connect"
		}
		
	}
	
	
	func bluetooth() {
		
		//Switch
		BLESwitch.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
		BLESwitch.center = CGPoint(x: 163, y: 200)
		DeviceLBL.text = "test"
		connectionStatusView.backgroundColor = UIColor.blue
		connectingActivityIndicator.backgroundColor = UIColor.yellow
		brandNameTextField.text = "tester"
		sensorLocationTextField.text = "tested"
		itemNameLabel.text = "name"
		bluetoothOffLabel.text = "lbl"
		
		connectionStatusView.center = CGPoint(x: 130, y: 130)
		connectingActivityIndicator.center =  CGPoint(x: 150, y: 150)
		brandNameTextField.center = CGPoint(x: 120, y: 120)
		brandNameTextField.textColor = UIColor.black
		
		self.view.addSubview(BLESwitch)
		self.view.addSubview(DeviceLBL)
		self.view.addSubview(connectionStatusView)
		self.view.addSubview(connectingActivityIndicator)
		self.view.addSubview(brandNameTextField)
		self.view.addSubview(sensorLocationTextField)
		self.view.addSubview(itemNameLabel)
		self.view.addSubview(bluetoothOffLabel)
		
		
		//LBL
		connectedLBL.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
		connectedLBL.center = CGPoint(x: 160, y: 285)
		connectedLBL.textAlignment = .center
		connectedLBL.text = "Connect"
		self.view.addSubview(connectedLBL)
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - CBCentralManagerDelegate methods
	
	// STEP 3.1: this method is called based on
	// the device's Bluetooth state; we can ONLY
	// scan for peripherals if Bluetooth is .poweredOn
	func centralManagerDidUpdateState(_ central: CBCentralManager) {
		
		switch central.state {
			
		case .unknown:
			print("Bluetooth status is UNKNOWN")
			bluetoothOffLabel.alpha = 1.0
		case .resetting:
			print("Bluetooth status is RESETTING")
			bluetoothOffLabel.alpha = 1.0
		case .unsupported:
			print("Bluetooth status is UNSUPPORTED")
			bluetoothOffLabel.alpha = 1.0
		case .unauthorized:
			print("Bluetooth status is UNAUTHORIZED")
			bluetoothOffLabel.alpha = 1.0
		case .poweredOff:
			print("Bluetooth status is POWERED OFF")
			bluetoothOffLabel.alpha = 1.0
		case .poweredOn:
			//self.view.backgroundColor = UIColor.red
			print("Bluetooth status is POWERED ON")
			
			DispatchQueue.main.async { () -> Void in
				self.bluetoothOffLabel.alpha = 0.0
				
				
				self.connectingActivityIndicator.startAnimating()
				
			}
			
			// STEP 3.2: scan for peripherals that we're interested in
			centralManager?.scanForPeripherals(withServices: [BLE_RFID_CBUUID])
			
		} // END switch
		
	} // END func centralManagerDidUpdateState
	
	// STEP 4.1: discover what peripheral devices OF INTEREST
	// are available for this app to connect to
	func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
		
		print(peripheral.name!)
		decodePeripheralState(peripheralState: peripheral.state)
		// STEP 4.2: MUST store a reference to the peripheral in
		// class instance variable
		peripheralRfidReader = peripheral
		// STEP 4.3: since HeartRateMonitorViewController
		// adopts the CBPeripheralDelegate protocol,
		// the peripheralHeartRateMonitor must set its
		// delegate property to HeartRateMonitorViewController
		// (self)
		peripheralRfidReader?.delegate = self
		
		// STEP 5: stop scanning to preserve battery life;
		// re-scan if disconnected
		centralManager?.stopScan()
		
		// STEP 6: connect to the discovered peripheral of interest
		centralManager?.connect(peripheralRfidReader!)
		
	} // END func centralManager(... didDiscover peripheral
	
	// STEP 7: "Invoked when a connection is successfully created with a peripheral."
	// we can only move forwards when we know the connection
	// to the peripheral succeeded
	func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
		
		DispatchQueue.main.async { () -> Void in
			
			self.brandNameTextField.text = peripheral.name!
			self.connectionStatusView.backgroundColor = UIColor.green
			self.itemNameLabel.text = "---"
			self.sensorLocationTextField.text = "----"
			self.connectingActivityIndicator.stopAnimating()
			
		}
		
		// STEP 8: look for services of interest on peripheral
		peripheralRfidReader?.discoverServices([BLE_RFID_CBUUID])
		
	} // END func centralManager(... didConnect peripheral
	
	// STEP 15: when a peripheral disconnects, take
	// use-case-appropriate action
	func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
		
		// print("Disconnected!")
		
		DispatchQueue.main.async { () -> Void in
			
			self.brandNameTextField.text = "----"
			self.connectionStatusView.backgroundColor = UIColor.red
			self.itemNameLabel.text = "---"
			self.sensorLocationTextField.text = "----"
			self.connectingActivityIndicator.startAnimating()
			
		}
		
		// STEP 16: in this use-case, start scanning
		// for the same peripheral or another, as long
		// as they're HRMs, to come back online
		centralManager?.scanForPeripherals(withServices: [BLE_RFID_CBUUID])
		
	} // END func centralManager(... didDisconnectPeripheral peripheral
	
	// MARK: - CBPeripheralDelegate methods
	
	func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
		
		for service in peripheral.services! {
			
			if service.uuid == BLE_RFID_CBUUID {
				
				print("Service: \(service)")
				
				// STEP 9: look for characteristics of interest
				// within services of interest
				peripheral.discoverCharacteristics(nil, for: service)
				
			}
			
		}
		
	} // END func peripheral(... didDiscoverServices
	
	// STEP 10: confirm we've discovered characteristics
	// of interest within services of interest
	func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
		
		for characteristic in service.characteristics! {
			print(characteristic)
			
			if characteristic.uuid == BLE_ObjectSize_Characteristic_CBUUID {
				
				// STEP 11: subscribe to a single notification
				// for characteristic of interest;
				// "When you call this method to read
				// the value of a characteristic, the peripheral
				// calls ... peripheral:didUpdateValueForCharacteristic:error:
				//
				// Read    Mandatory
				//
				peripheral.readValue(for: characteristic)
				
			}
			
			if characteristic.uuid == BLE_OTS_Feature_Characteristic_CBUUID {
				
				// STEP 11: subscribe to regular notifications
				// for characteristic of interest;
				// "When you enable notifications for the
				// characteristic’s value, the peripheral calls
				// ... peripheral(_:didUpdateValueFor:error:)
				//
				// Notify    Mandatory
				//
				peripheral.setNotifyValue(true, for: characteristic)
				
			}
			
		} // END for
		
	} // END func peripheral(... didDiscoverCharacteristicsFor service
	
	// STEP 12: we're notified whenever a characteristic
	// value updates regularly or posts once; read and
	// decipher the characteristic value(s) that we've
	// subscribed to
	func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
		
		if characteristic.uuid == BLE_OTS_Feature_Characteristic_CBUUID {
			
			// STEP 13: we generally have to decode BLE
			// data into human readable format
			let heartRate = deriveBeatsPerMinute(using: characteristic)
			
			DispatchQueue.main.async { () -> Void in
				
				UIView.animate(withDuration: 1.0, animations: {
					self.itemNameLabel.alpha = 1.0
					self.itemNameLabel.text = String(heartRate)
				}, completion: { (true) in
					self.itemNameLabel.alpha = 0.0
				})
				
			} // END DispatchQueue.main.async...
			
		} // END if characteristic.uuid ==...
		
		if characteristic.uuid == BLE_ObjectSize_Characteristic_CBUUID {
			
			// STEP 14: we generally have to decode BLE
			// data into human readable format
			let sensorLocation = readSensorLocation(using: characteristic)
			
			DispatchQueue.main.async { () -> Void in
				self.sensorLocationTextField.text = sensorLocation
			}
		} // END if characteristic.uuid ==...
		
	} // END func peripheral(... didUpdateValueFor characteristic
	
	// MARK: - Utilities
	
	func deriveBeatsPerMinute(using heartRateMeasurementCharacteristic: CBCharacteristic) -> Int {
		
		let heartRateValue = heartRateMeasurementCharacteristic.value!
		// convert to an array of unsigned 8-bit integers
		let buffer = [UInt8](heartRateValue)
		
		// UInt8: "An 8-bit unsigned integer value type."
		
		// the first byte (8 bits) in the buffer is flags
		// (meta data governing the rest of the packet);
		// if the least significant bit (LSB) is 0,
		// the heart rate (bpm) is UInt8, if LSB is 1, BPM is UInt16
		if ((buffer[0] & 0x01) == 0) {
			// second byte: "Heart Rate Value Format is set to UINT8."
			print("BPM is UInt8")
			// write heart rate to HKHealthStore
			// healthKitInterface.writeHeartRateData(heartRate: Int(buffer[1]))
			return Int(buffer[1])
		} else { // I've never seen this use case, so I'll
			// leave it to theoroticians to argue
			// 2nd and 3rd bytes: "Heart Rate Value Format is set to UINT16."
			print("BPM is UInt16")
			return -1
		}
		
	} // END func deriveBeatsPerMinute
	
	func readSensorLocation(using sensorLocationCharacteristic: CBCharacteristic) -> String {
		
		let sensorLocationValue = sensorLocationCharacteristic.value!
		// convert to an array of unsigned 8-bit integers
		let buffer = [UInt8](sensorLocationValue)
		var sensorLocation = ""
		
		// look at just 8 bits
		if buffer[0] == 1
		{
			sensorLocation = "Chest"
		}
		else if buffer[0] == 2
		{
			sensorLocation = "Wrist"
		}
		else
		{
			sensorLocation = "N/A"
		}
		
		return sensorLocation
		
	} // END func readSensorLocation
	
	func decodePeripheralState(peripheralState: CBPeripheralState) {
		
		switch peripheralState {
		case .disconnected:
			print("Peripheral state: disconnected")
		case .connected:
			print("Peripheral state: connected")
		case .connecting:
			print("Peripheral state: connecting")
		case .disconnecting:
			print("Peripheral state: disconnecting")
		}
		
	} // END func decodePeripheralState(peripheralState
	
} // END class HeartRateMonitorViewController
*/
