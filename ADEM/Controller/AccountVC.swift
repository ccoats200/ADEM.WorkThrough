//
//  SettingsVC.swift
//  ADEM
//
//  Created by Coleman Coats on 3/2/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit
import CoreBluetooth


class AccountVC: UIViewController {
	
	var centralManager: CBCentralManager!
	
	//UIElements
	var connectedLBL = UILabel()
	var BLESwitch = UISwitch()
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		bluetooth()
		BLESwitch.addTarget(self, action: #selector(switchStatus(_:)), for: UIControl.Event.valueChanged)
	}
	
	
	
	//BluetoothStatus
	@objc func switchStatus(_ sender: UISwitch) {
		if sender.isOn {
			connectedLBL.text = "Connected"
		} else {
			connectedLBL.text = "Connect"
		}
	}
	
	func bluetooth() {
		
		//Switch
		BLESwitch.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
		BLESwitch.center = CGPoint(x: 163, y: 200)
		self.view.addSubview(BLESwitch)

		//LBL
		connectedLBL.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
		connectedLBL.center = CGPoint(x: 160, y: 285)
		connectedLBL.textAlignment = .center
		connectedLBL.text = "Connect"
		self.view.addSubview(connectedLBL)
	}

	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



