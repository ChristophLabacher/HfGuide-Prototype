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
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var consoleLabel: UILabel!

    @IBOutlet weak var beaconLabel: UILabel!

    @IBOutlet weak var newBeaconsLabel: UILabel!
    @IBOutlet weak var nearBeaconsLabel: UILabel!
    @IBOutlet weak var goneBeaconsLabel: UILabel!
    
    var searchingBeacons = false
    var searchingInterval = 0.2
    
    
    var tempBeaconArray: [CLBeacon]!
    var tempBeaconArraySet = false
    
    var newBeaconsArray: [CLBeacon]!
    var nearBeaconsArray: [CLBeacon]!
    var goneBeaconsArray: [CLBeacon]!
    
    

	
    @IBAction func searchButton(sender: AnyObject) {
        if !searchingBeacons {
            var searchingTimer = NSTimer.scheduledTimerWithTimeInterval(searchingInterval, target: self, selector: "searchForBeacon", userInfo: nil, repeats: true)
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
            
            
            
            

            //Writing all available beacons
            //allBeacons
            writeBeaconsToLabel(didRangeBeacons: beacons as! [CLBeacon], labelToWriteTo: beaconLabel)
            
            
            
            //only new Beacons which were found for the first time
            writeBeaconsToLabel(didRangeBeacons: newBeaconsArray, labelToWriteTo: newBeaconsLabel)
            
            //only nearBeacons who were there already at the last check and are still there
            writeBeaconsToLabel(didRangeBeacons: nearBeaconsArray, labelToWriteTo: nearBeaconsLabel)
            
            //only goneBeacons who were there at the latest check but not anymore
            writeBeaconsToLabel(didRangeBeacons: goneBeaconsArray, labelToWriteTo: goneBeaconsLabel)
            
            

            //starting to check for different commodities
            checkForWebpage(didRangeBeacons: beacons)

            
            
            
            beaconManager.stopRangingBeaconsInRegion(region)
            
	}

    //sortBeacons sorts the available Beacons into three Arrays (new/near/old)
    func sortBeacons(didRangeBeacons beacons: [AnyObject]!){
        
        newBeaconsArray = []
        nearBeaconsArray = []
        goneBeaconsArray = []
        
        
        if !beacons.isEmpty{
            
            if tempBeaconArraySet {


                for index in 0..<beacons.count{
                    
                    //hier muss jetzt für jedes beacon[] Element überprüft werden, ob er in tempBeaconArray gesetzt ist
                    //das find funktioniert jedoch nicht so richtig - ich weiß aber nicht warum.
                    //kann mir das aber auch nicht richtig ausgeben lassen.
                    if (find(tempBeaconArray, beacons[index] as! CLBeacon) != nil){

                        //wenn ja > copy to nearBeacon
                        nearBeaconsArray.append(beacons[index] as! CLBeacon)
                        
                        //and delete from temp
                        tempBeaconArray.removeAtIndex(find(tempBeaconArray, beacons[index] as! CLBeacon)!)
                        
                    }else{
                        consoleLabel.text = (consoleLabel.text ?? "") + "no ";

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
    func writeBeaconsToLabel(didRangeBeacons beacons: [AnyObject]!, labelToWriteTo: UILabel!){
        
        var returnString = "No Beacons here."
        
        if !beacons.isEmpty{
            returnString = ""
            for index in 0..<beacons.count {
                var followingText : String
                var beacon = beacons[index] as? CLBeacon
                followingText = "[\(beacon!.major.integerValue).\(beacon!.minor.integerValue)]"
                returnString += followingText
            }
        }
        
        labelToWriteTo.text = returnString
        
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

