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
	var visibleItems = 0
	
	func collectionView(collectionView: UICollectionView, numberOfSectionsInCollectionView section: Int) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}
 
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ScrollCollectionViewCell
		
		cell.data = data[indexPath.item]
		cell.initCard(indexPath)

		if cell.data.visible	{
		}
		
		if cell.data.hasBecomeActive	{
			cell.isActive()
		} else	if cell.data.active	{
			cell.becomeActive()
		}
		
		if cell.data.read	{
			cell.wasRead()
		}
		
		if cell.data.selected	{
			cell.wasSelected()
		} else	{
			cell.wasDeselected()
		}
		
		return cell
	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
		let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ScrollCollectionViewCell
		
		if cell.data!.visible	{
			
			collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
			
			for card in scrollCollectionViewDelegateAndDataSource.data	{
				card.selected = false
			}
			
			cell.data.selected = true
			collectionView.reloadData()
			
		//	mainCollectionView!.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
			println(invisibleScrollView!.frame.width)
			println(indexPath.item)
			
			var slideWidth : Double = Double(invisibleScrollView!.frame.width)
			var path : Double = Double(indexPath.item)
			var test = slideWidth * path
			
			UIView.animateWithDuration(0.3, animations: {
				invisibleScrollView?.contentOffset.x = CGFloat(Double(invisibleScrollView!.frame.width) * Double(indexPath.item))
			})
		}
		
		
		//collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
		//mainCollectionView?.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
		
	}
}
