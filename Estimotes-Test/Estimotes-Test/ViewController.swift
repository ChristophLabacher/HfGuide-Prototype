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
    @IBOutlet weak var searchButton: UIButton!
    
    
    var searchingBeacons = false;
    var hasChanged = false;
    var searchingInterval = 0.2
	
    @IBAction func searchButton(sender: AnyObject) {

        var searchingTimer = NSTimer.scheduledTimerWithTimeInterval(searchingInterval, target: self, selector: "searchForBeacon", userInfo: nil, repeats: true)
        
        if !searchingBeacons || hasChanged {
            searchButton.setTitle("Searching Beacons …", forState: UIControlState.Normal)
        }
        
        searchingBeacons = true

	}
    

    
	let beaconManager = ESTBeaconManager()
	
	let beaconRegion = CLBeaconRegion(
		proximityUUID: NSUUID(UUIDString: "B60F3FAE-04B4-4367-9DD5-0B9B5CA759ED"),
		identifier: "beaconTestRegion")

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
            
            //listing all available beacons
            beaconLabel.text = listAvailableBeacons(didRangeBeacons: beacons);
            
            //starting to check for different commodities
            checkForWebpage(didRangeBeacons: beacons)

            
            beaconManager.stopRangingBeaconsInRegion(region)
            
	}
    
    
    //returns a string of all available beacons with major and minor
    func listAvailableBeacons(didRangeBeacons beacons: [AnyObject]!) -> String{
        
        var returnString = "No Beacons found!"
        
        if !beacons.isEmpty{
            returnString = "Following Beacons were found: "
            for index in 0..<beacons.count {
                var followingText : String
                var beacon = beacons[index] as! CLBeacon
                followingText = "[\(beacon.major.integerValue).\(beacon.minor.integerValue)] + \(beacon.rssi)"
                returnString += followingText
            }
        }
        
        return returnString
    }

    
    func checkForWebpage(didRangeBeacons beacons: [AnyObject]!){
        //this function checks if the nearest is 1.1
        if let nearestBeacon = beacons.first as? CLBeacon {
            loadWebpage(nearestBeacon.minor.integerValue)
        }
    }
    
    
	
	func loadWebpage(minorId: Int)	{
		switch minorId{
        case 1:
			let localfilePath = NSBundle.mainBundle().URLForResource("website", withExtension: "html");
			let requestObj = NSURLRequest(URL: localfilePath!)
			webView.loadRequest(requestObj)
        default:
            break
        }
	}
}

