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
    
    @IBOutlet weak var newBeacons: UILabel!
    @IBOutlet weak var nearBeacons: UILabel!
    @IBOutlet weak var goneBeacons: UILabel!
    
    var searchingBeacons = false
    var searchingInterval = 0.2
    
    
    var tempBeaconArray: [CLBeacon]!
    var tempBeaconArraySet = false
    
    var newBeaconsArray: [CLBeacon]!
    var nearBeaconsArray: [CLBeacon]!
    var goneBeaconsArray: [CLBeacon]!
    
    

	
    @IBAction func searchButton(sender: AnyObject) {

        var searchingTimer = NSTimer.scheduledTimerWithTimeInterval(searchingInterval, target: self, selector: "searchForBeacon", userInfo: nil, repeats: true)
        
        if !searchingBeacons {
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
            
            
            //sort the Beacons
            sortBeacons(didRangeBeacons: beacons)
            
            
            
            //checkBeacons()
            //hier müsste der check geschehen, der zusammen mit den XML-Dateien überprüft ob ein Beacon neu ist und daraufhin auch etwas getriggert werden muss > reden mit labi
            
            
            
            //writing all available beacons
            //todo: umschreiben, dass die labels einzeln aktiviert werden (dazu übergabe der verschiedenen labels und jeweiligen arrays)
            beaconLabel.text = listAvailableBeacons(didRangeBeacons: beacons)

            //starting to check for different commodities
            checkForWebpage(didRangeBeacons: beacons)

            
            
            
            beaconManager.stopRangingBeaconsInRegion(region)
            
	}

    //sortBeacons sorts the available Beacons into three Arrays (new/near/old)
    func sortBeacons(didRangeBeacons beacons: [AnyObject]!){
        if !beacons.isEmpty{
            if tempBeaconArraySet {

                //hier muss jetzt für jedes beacon[] Element überprüft werden, ob er in tempBeaconArray gesetzt ist


                for index in 0..<beacons.count{
                    if contains(tempBeaconArray, beacons[index] as! CLBeacon){
                        //wenn ja > copy to nearBeacon
                        nearBeaconsArray.append(beacons[index] as! CLBeacon)
                        
                        //and delete from temp
                        tempBeaconArray.removeAtIndex(find(tempBeaconArray, beacons[index] as! CLBeacon)!)
                        
                    }else{
                        //wenn nein > copy to newBeacon
                        newBeaconsArray.append(beacons[index] as! CLBeacon)
                        
                    }
                }
                
                //die übrigen werden zu oldBeacon kopiert
                goneBeaconsArray = tempBeaconArray

                //tempBeaconArray wird auf beacons gesetzt
                tempBeaconArray = beacons as! [CLBeacon]
                
            }else{
                //wenn tempBeaconArray noch nicht gesetzt wurde wird es gesetzt und alle vorhandenen beacons sind neu
                //im prinzip die initialisierung
                
                tempBeaconArray = beacons as! [CLBeacon]
                tempBeaconArraySet = true
                newBeaconsArray = beacons as! [CLBeacon]
            }
        }
    }
    
    
    
    
    
    //returns a string of all available beacons with major and minor and writes into the specific label
    func listAvailableBeacons(didRangeBeacons beacons: [AnyObject]!) -> String{
        
        var returnString = "No Beacons found!"
        
        if !beacons.isEmpty{
            returnString = "Following Beacons were found: "
            for index in 0..<beacons.count {
                var followingText : String
                var beacon = beacons[index] as! CLBeacon
                followingText = "[\(beacon.major.integerValue).\(beacon.minor.integerValue)]"
                returnString += followingText
            }
        }
        
        return returnString
    }

    
    
    
    //this function checks if the nearest is 1.1 and opens a webpage
    func checkForWebpage(didRangeBeacons beacons: [AnyObject]!){
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

