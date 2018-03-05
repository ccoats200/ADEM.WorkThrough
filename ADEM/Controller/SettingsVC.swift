//
//  SettingsVC.swift
//  ADEM
//
//  Created by Coleman Coats on 3/2/18.
//  Copyright © 2018 Coleman Coats. All rights reserved.
//

import UIKit
import CoreBluetooth


class SettingsVC: UIViewController {
	@IBOutlet weak var ConnectedLBL: UILabel!
	var centralManager: CBCentralManager!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		centralManager = CBCentralManager(delegate: self, queue: nil)
	}

	
	
	
	
	@IBAction func connectSw(_ sender: Any) {
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



