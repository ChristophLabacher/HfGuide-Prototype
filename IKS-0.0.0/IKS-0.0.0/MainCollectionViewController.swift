//
//  mainCollectionViewController.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class MainCollectionViewController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource  {
	
	func collectionView(collectionView: UICollectionView, numberOfSectionsInCollectionView section: Int) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
 
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MainCollectionViewCell
		
		//cell.imageView.image = UIImage(named: String(viewController.dataArray![indexPath.item] as! NSString))
		cell.imageView.image = UIImage(named: "cousteau.png")
		cell.textLabel.text = String("test")
		
		return cell
	}
}
