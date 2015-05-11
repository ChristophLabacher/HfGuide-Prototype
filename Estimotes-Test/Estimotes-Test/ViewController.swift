//
//  ViewController.swift
//  Estimotes-Test
//
//  Created by Christoph Labacher on 26.04.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, ESTBeaconManagerDelegate {
	
	@IBOutlet weak var webView: UIWebView!
	
	@IBOutlet weak var beaconLabel: UILabel!
	@IBAction func searchButton(sender: AnyObject) {
		searchForBeacon()
	}

	let beaconManager = ESTBeaconManager()
	
	let beaconRegion = CLBeaconRegion(
		proximityUUID: NSUUID(UUIDString: "F58B894E-A44F-450A-9DCC-82A125249137"),
		identifier: "Test")

	override func viewDidLoad() {
		super.viewDidLoad()
		beaconManager.delegate = self
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func searchForBeacon()	{
		beaconManager.requestWhenInUseAuthorization()
		beaconManager.startRangingBeaconsInRegion(beaconRegion)
	}
	
	func beaconManager(manager: AnyObject!,
		didRangeBeacons beacons: [AnyObject]!,
		inRegion region: CLBeaconRegion!) {
			if let nearestBeacon = beacons.first as? CLBeacon {
				beaconManager.stopRangingBeaconsInRegion(region)
				beaconLabel.text = "Found Beacon! \(nearestBeacon.major.integerValue) - \(nearestBeacon.minor.integerValue)"
				loadWebpage(nearestBeacon.minor.integerValue)
			}
	}
	
	func loadWebpage(minorId: Int)	{
		if (minorId == 1)	{
			let localfilePath = NSBundle.mainBundle().URLForResource("website", withExtension: "html");
			let requestObj = NSURLRequest(URL: localfilePath!)
			webView.loadRequest(requestObj)
		}
	}
}

