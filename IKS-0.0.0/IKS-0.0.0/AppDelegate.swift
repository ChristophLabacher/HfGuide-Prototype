	//
//  AppDelegate.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

var dataArray:NSArray?
	
	// COLLECTIONVIEWS
	// ScrollCollectionView
	var scrollCollectionView:UICollectionView?
	var scrollCollectionViewDelegateAndDataSource = ScrollCollectionViewDelegateAndDataSource()
	
	// MainCollectionView
	var mainCollectionView:UICollectionView?
	var mainCollectionViewDelegateAndDataSource = MainCollectionViewDelegateAndDataSource()
	
	// COLORS
	let appColorRed : UIColor = UIColor(hue: 3.0/360, saturation: 63.0/100, brightness: 95.0/100, alpha: 1.0)
	let appColorYellow : UIColor = UIColor(hue: 55.0/360, saturation: 85.0/100, brightness: 99.0/100, alpha: 1.0)
	let appColorGreen : UIColor = UIColor(hue: 90.0/360, saturation: 67.0/100, brightness: 79.0/100, alpha: 1.0)
	let appColorBlue : UIColor = UIColor(hue: 192.0/360, saturation: 85.0/100, brightness: 78.0/100, alpha: 1.0)
	let appColorViolet : UIColor = UIColor(hue: 270.0/360, saturation: 45.0/100, brightness: 72.0/100, alpha: 1.0)
	let appColorGrey : UIColor = UIColor(hue: 0.0/360, saturation: 0.0/100, brightness: 60.0/100, alpha: 1.0)
	
	let colors : [String : UIColor] = ["Projekt" : appColorRed, "Frage" : appColorBlue, "Ausstattung" : appColorGreen, "Bewerbung" : appColorYellow, "Eigenes" : appColorViolet]
 	
	var cards : [Card] = []
	
	// BEACONS
	let logBeacons = false
	var searchingInterval = 0.2
	var searchingTimer = NSTimer()
	var searchingBeacons = false
	
	var saveBeaconArray: [Int]!
	
	var tempBeaconArray: [Int]!
	var tempBeaconArraySet = false
	
	var newBeaconsArray: [Int]!
	var nearBeaconsArray: [Int]!
	var goneBeaconsArray: [Int]!
	
	let beaconManager = ESTBeaconManager()
	let beaconManagerDelegate = BeaconDelegate()
	
	let beaconRegion = CLBeaconRegion(
		proximityUUID: NSUUID(UUIDString: "B60F3FAE-04B4-4367-9DD5-0B9B5CA759ED"),
		identifier: "hfgBeaconsRegion")


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		
		// Load Data
		var path = NSBundle.mainBundle().pathForResource("cards", ofType: "plist")
		var data = NSArray(contentsOfFile: path!)!
		
		for card in data {
			cards.append(Card(card: card as! NSDictionary))
		}
		
		// Setup Window & ViewController
		UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
		
		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window!.backgroundColor = UIColor.whiteColor()
		window!.rootViewController = ViewController()
		window!.makeKeyAndVisible()
		
		
		// Beacons
		beaconManager.delegate = beaconManagerDelegate
		searchingTimer = NSTimer.scheduledTimerWithTimeInterval(searchingInterval, target: self, selector: "searchForBeacon", userInfo: nil, repeats: true)
		
		searchingBeacons = true
		
		return true
	}

	func searchForBeacon()	{
		//reset der arrays
		newBeaconsArray = []
		nearBeaconsArray = []
		goneBeaconsArray = []
		
		//reset saveBeaconArray
		saveBeaconArray = []
		
		beaconManager.requestWhenInUseAuthorization()
		beaconManager.startRangingBeaconsInRegion(beaconRegion)
		
		if logBeacons	{
			print(".")
		}
	}
	
	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}
	
func dictionaryOfNames(arr:UIView...) -> Dictionary<String,UIView> {
	var d = Dictionary<String,UIView>()
	for (ix,v) in enumerate(arr) {
		d["v\(ix+1)"] = v
	}
	return d
}

