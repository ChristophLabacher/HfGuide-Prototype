//
//  ScrollCollectionViewController.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class MainCollectionViewController: NSObject, UICollectionViewDelegate, UICollectionViewDataSource  {
	var cellMargin : CGFloat = 80

	override init() {
	//	print("test")
	}
	
	func collectionView(collectionView: UICollectionView, numberOfSectionsInCollectionView section: Int) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataArray!.count
	}
 
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MainCollectionViewCell
		
		//let cell : MainCollectionViewCell = MainCollectionViewCell()
		
		let path = String(dataArray![indexPath.item] as! NSString);
		cell.backgroundImage.image = UIImage(named: path)
		
		return cell
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
		return CGSizeMake(collectionView.frame.size.width-cellMargin, collectionView.frame.size.height)
	}
	
	func setMarginZero()	{
		self.cellMargin = 0
	}
}
