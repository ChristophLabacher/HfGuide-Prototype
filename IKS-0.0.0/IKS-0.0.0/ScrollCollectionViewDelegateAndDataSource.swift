//
//  ScrollCollectionViewController.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ScrollCollectionViewDelegateAndDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource  {
	var data : [Card] = []
	
	func collectionView(collectionView: UICollectionView, numberOfSectionsInCollectionView section: Int) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}
 
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ScrollCollectionViewCell
		
		cell.data = data[indexPath.item]
		cell.initCard()
		
		if cell.data.active	{
			cell.becameActive()
		}
		
		return cell
	}
	
//	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//		let cell = collectionView.cellForItemAtIndexPath(indexPath)
//		collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
//		mainCollectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
//	}
}
