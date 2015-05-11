//
//  ViewController.swift
//  collectionViewTest
//
//  Created by Christoph Labacher on 08.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	var collectionView1: UICollectionView?
	var collectionView2: UICollectionView?
	var currentCell: Int?

	var dataArray: NSArray?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadImages()
		
		// Do any additional setup after loading the view, typically from a nib.
		
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height-200)
		layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		layout.minimumLineSpacing = 0
		layout.minimumInteritemSpacing = 0

		collectionView1 = UICollectionView(frame: CGRectMake(0, 200, self.view.frame.width, self.view.frame.height-200), collectionViewLayout: layout)
		collectionView1!.showsHorizontalScrollIndicator = false
		collectionView1!.pagingEnabled = true;
		collectionView1!.dataSource = self
		collectionView1!.delegate = self
		collectionView1!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		collectionView1!.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(collectionView1!)
		
		let layout2: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout2.itemSize = CGSize(width: 140, height: 140)
		layout2.scrollDirection = UICollectionViewScrollDirection.Horizontal
		layout2.minimumLineSpacing = 20
		layout2.minimumInteritemSpacing = 20
		
		collectionView2 = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.width, 200), collectionViewLayout: layout2)
		collectionView2!.dataSource = self
		collectionView2!.delegate = self
		collectionView2!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		collectionView2!.backgroundColor = UIColor.whiteColor()
		collectionView2!.allowsSelection = true
		collectionView2!.allowsMultipleSelection = false
		collectionView2!.delaysContentTouches = true
		self.view.addSubview(collectionView2!)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func collectionView(collectionView: UICollectionView, numberOfSectionsInCollectionView section: Int) -> Int {
		return 1
	}

	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.dataArray!.count
	}
	
	func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
		let cell = collectionView.cellForItemAtIndexPath(indexPath)
		cell?.backgroundColor = UIColor.greenColor()
	}
	
	func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
		let cell = collectionView.cellForItemAtIndexPath(indexPath)
		cell?.backgroundColor = UIColor.whiteColor()
	
		self.currentCell = indexPath.row
		collectionView1?.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
		collectionView2?.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
	}
	
 
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
		cell.imageView.image = UIImage(named: String(self.dataArray![indexPath.item] as! NSString))
		cell.textLabel.text = String(self.dataArray![indexPath.item] as! NSString)	
		
		return cell
	}
	
	func scrollViewDidEndDecelerating(scrollView: UIScrollView)	{
		let page = ceil(scrollView.contentSize.width / scrollView.frame.size.width) - 1;
		//let pageInt = Int(CGFloat(page))
		//let path = NSIndexPath(forRow: pageInt, inSection: 0)
		let numberFormatter = NSNumberFormatter()
		NSLog(numberFormatter.stringFromNumber(page)!)
			
		let path = NSIndexPath(forRow: 2, inSection: 0)
		collectionView2?.scrollToItemAtIndexPath(path, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
	}
	
	func loadImages()	{
		let sourcePath = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("Assets")
		self.dataArray = NSFileManager.defaultManager().contentsOfDirectoryAtPath(sourcePath!, error: nil)
	}
}

