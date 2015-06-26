//
//  BeaconManager.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 24.06.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class BeaconDelegate: NSObject, ESTBeaconManagerDelegate {
	
	func beaconManager(manager: AnyObject!,
		didRangeBeacons beacons: [AnyObject]!,
		inRegion region: CLBeaconRegion!) {
		
//		print("|")
			
		//Kopie aller available minors erstellen und in saveBeaconArray speichern
		//gleichzeitig rssis auslesen und für eine höhere responsivnes über einem bestimmten wert kicken
		if !beacons.isEmpty{
			for index in 0..<beacons.count {
				var beacon = beacons[index] as? CLBeacon
				var beaconMinor = beacon!.minor.integerValue
				var beaconRssi = beacon!.rssi
				if beaconRssi < -10 {
					//dies muss in evtl. ausstellungssituationen angepasst werden mit der stärke des broadcasting
					// hier könnten auch weitere berechnungen zur entfernung stattfinden
					saveBeaconArray.append(beaconMinor)
				}
				
			}
		}
		
		//sort the Beacons - dann nur die minor
		sortBeaconsIntoArrays(saveBeaconArray)
			
//			println(newBeaconsArray)
		
		//checkBeacons()
		//hier müsste der check geschehen, der zusammen mit den XML-Dateien überprüft ob ein Beacon neu ist und daraufhin auch etwas getriggert werden muss > reden mit labi
		manager.stopRangingBeaconsInRegion(region)
			
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
				
			}
		} else if tempBeaconArraySet {
			if !tempBeaconArray.isEmpty{
				goneBeaconsArray = tempBeaconArray
				tempBeaconArray = []
			}
		}
		
	}
}
