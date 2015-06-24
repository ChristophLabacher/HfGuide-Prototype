//
//  ViewController.swift
//  Estimotes-Test
//
//  Created by Christoph Labacher on 26.04.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIWebViewDelegate, ESTBeaconManagerDelegate {
	
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var consoleLabel: UITextView!

    @IBOutlet weak var beaconLabel: UILabel!

    @IBOutlet weak var newBeaconsLabel: UILabel!
    @IBOutlet weak var nearBeaconsLabel: UILabel!
    @IBOutlet weak var goneBeaconsLabel: UILabel!

    @IBOutlet weak var rssiFilteringSwitch: UISwitch!
    @IBOutlet weak var printIntervalSwitch: UISwitch!
    @IBOutlet weak var printOnRangeScanSwitch: UISwitch!
    @IBOutlet weak var printFoundGoneSwitch: UISwitch!

    
    var rssiFiltering = true
    var printInterval = true
    var printRange = true
    var printFoundGone = true;

    
    var searchingInterval = 0.2
    var searchingTimer = NSTimer()
    var searchingBeacons = false
    
    
    //saveBeaconArray ist dafür da
    var saveBeaconArray: [Int]!
    
    var tempBeaconArray: [Int]!
    var tempBeaconArraySet = false
    
    var newBeaconsArray: [Int]!
    var nearBeaconsArray: [Int]!
    var goneBeaconsArray: [Int]!
    
    

	
    @IBAction func searchButton(sender: AnyObject) {
        if !searchingBeacons {
            searchingTimer = NSTimer.scheduledTimerWithTimeInterval(searchingInterval, target: self, selector: "searchForBeacon", userInfo: nil, repeats: true)

            searchButton.setTitle("Searching Beacons …", forState: UIControlState.Normal)

            searchingBeacons = true
            
        } else {
            searchButton.setTitle("Searching is paused.",forState: UIControlState.Normal)
            
            searchingTimer.invalidate()

            searchingBeacons = false
            
        }
        
        

	}
    
    @IBAction func clearButton(sender: AnyObject){
        consoleLabel.text = ""
    }
    
	let beaconManager = ESTBeaconManager()
	
	let beaconRegion = CLBeaconRegion(
		proximityUUID: NSUUID(UUIDString: "B60F3FAE-04B4-4367-9DD5-0B9B5CA759ED"),
		identifier: "beaconTestRegion")

	override func viewDidLoad() {
		super.viewDidLoad()
        consoleLabel.text = ""
        
		beaconManager.delegate = self
        
        rssiFilteringSwitch.addTarget(self, action: Selector("rssiSwitch"), forControlEvents: UIControlEvents.ValueChanged)

        printIntervalSwitch.addTarget(self, action: Selector("intervalSwitch"), forControlEvents: UIControlEvents.ValueChanged)

        printOnRangeScanSwitch.addTarget(self, action: Selector("scanSwitch"), forControlEvents: UIControlEvents.ValueChanged)
        self
        printFoundGoneSwitch.addTarget(self, action: Selector("foundGoneSwitch"), forControlEvents: UIControlEvents.ValueChanged)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func searchForBeacon()	{
        if printInterval{
            consoleLabel.text = "." + (consoleLabel.text ?? "");
        }
        
        //reset der arrays
        newBeaconsArray = []
        nearBeaconsArray = []
        goneBeaconsArray = []
        
        
        //reset saveBeaconArray
        saveBeaconArray = []

		beaconManager.requestWhenInUseAuthorization()
		beaconManager.startRangingBeaconsInRegion(beaconRegion)
	}
	
	func beaconManager(manager: AnyObject!,
        didRangeBeacons beacons: [AnyObject]!,
        inRegion region: CLBeaconRegion!) {
            
            if printRange {
                consoleLabel.text = "|" + (consoleLabel.text ?? "");
            }

            
            
            
            //Kopie aller available minors erstellen und in saveBeaconArray speichern
            //gleichzeitig rssis auslesen und für eine höhere responsivnes über einem bestimmten wert kicken
            if !beacons.isEmpty{
                for index in 0..<beacons.count {
                    var beacon = beacons[index] as? CLBeacon
                    var beaconMinor = beacon!.minor.integerValue
                    var beaconRssi = beacon!.rssi
                    if beaconRssi < -10 || !rssiFiltering {
                            //dies muss in evtl. ausstellungssituationen angepasst werden mit der stärke des broadcasting
                            // hier könnten auch weitere berechnungen zur entfernung stattfinden
                        saveBeaconArray.append(beaconMinor)
                    }

                }
            }
            

            
            //sort the Beacons - dann nur die minor
            sortBeaconsIntoArrays(saveBeaconArray)


            
            
            //checkBeacons()
            //hier müsste der check geschehen, der zusammen mit den XML-Dateien überprüft ob ein Beacon neu ist und daraufhin auch etwas getriggert werden muss > reden mit labi
            

            //Writing all available beacons
            //allBeacons
            writeBeaconsToLabel(saveBeaconArray, labelToWriteTo: beaconLabel)
            
            //only new Beacons which were found for the first time
            writeBeaconsToLabel(newBeaconsArray, labelToWriteTo: newBeaconsLabel)
            
            //only nearBeacons who were there already at the last check and are still there
            writeBeaconsToLabel(nearBeaconsArray, labelToWriteTo: nearBeaconsLabel)
            
            //only goneBeacons who were there at the latest check but not anymore
            writeBeaconsToLabel(goneBeaconsArray, labelToWriteTo: goneBeaconsLabel)
            
            

            //starting to check for different commodities
            //checkForWebpage(didRangeBeacons: beacons)

            
            
            
            beaconManager.stopRangingBeaconsInRegion(region)
            
	}

    //sortBeaconsIntoArrays sorts the available Beacons into three Arrays (new/near/old)
    func sortBeaconsIntoArrays(sortArray: [Int]!){
        


        
        
        if !sortArray.isEmpty{
            
            if tempBeaconArraySet {


                for index in 0..<sortArray.count{
                    
                    //hier muss jetzt für jedes beacon[] Element überprüft werden, ob er in tempBeaconArray gesetzt ist
                    // ### das find() funktioniert jedoch nicht so richtig - ich weiß aber nicht warum.
                    // ### kann mir das aber auch nicht richtig ausgeben lassen.
                    
                    
                    if contains(tempBeaconArray, sortArray[index]){
                        
                        //wenn ja > copy to nearBeacon
                        nearBeaconsArray.append(sortArray[index])
                        
                        //and delete from temp
                        tempBeaconArray.removeAtIndex(find(tempBeaconArray, sortArray[index])!)
                        
                    } else {

                        //wenn nein > copy to newBeacon
                        newBeaconsArray.append(sortArray[index])
                        
                        if printFoundGone {
                            consoleLabel.text = "X" + (consoleLabel.text ?? "");
                        }
                    }
                }
                
                //die übrigen werden zu oldBeacon kopiert
                goneBeaconsArray = tempBeaconArray

                //tempBeaconArray wird auf beacons gesetzt
                tempBeaconArray = sortArray
            
            } else {
                //wenn tempBeaconArray noch nicht gesetzt wurde wird es gesetzt und alle vorhandenen beacons sind neu
                //im prinzip die initialisierung
                tempBeaconArray = sortArray
                tempBeaconArraySet = true
                newBeaconsArray = sortArray
                
                if printFoundGone {
                    for index in 0..<newBeaconsArray.count{
                        consoleLabel.text = "X" + (consoleLabel.text ?? "");
                    }
                }
                
            }
        } else if tempBeaconArraySet {
            if !tempBeaconArray.isEmpty{
                goneBeaconsArray = tempBeaconArray
                tempBeaconArray = []
            }
        }
        
        if !goneBeaconsArray.isEmpty && printFoundGone {
            for index in 0..<goneBeaconsArray.count{
                consoleLabel.text = "O" + (consoleLabel.text ?? "");
            }
        }
        
    }
    
    
    
    
    
    //returns a string of all available beacons with major and minor and writes into the specific label
    func writeBeaconsToLabel(writeArray: [Int]!, labelToWriteTo: UILabel!){
        
        var returnString = "No Beacons here."
        
        if !writeArray.isEmpty{
            returnString = ""
            for index in 0..<writeArray.count {
                var followingText : String
                var beaconMinor = writeArray[index]
                followingText = "[\(beaconMinor)]"
                returnString += followingText
            }
        }
        
        labelToWriteTo.text = returnString
        
    }

    
    
    func rssiSwitch() {
        if !rssiFiltering {
            rssiFiltering = true
        } else {
            rssiFiltering = false
        }
    }
   
    func intervalSwitch() {
        if !printInterval {
            printInterval = true
        } else {
            printInterval = false
        }
    }
    
    func scanSwitch() {
        if !printRange {
            printRange = true
        } else {
            printRange = false
        }
    }
    
    func foundGoneSwitch() {
        if !printFoundGone {
            printFoundGone = true
        } else {
            printFoundGone = false
        }
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
			//webView.loadRequest(requestObj)
            //kicked the webView
        default:
            break
        }
	}
    
    
}

