//
//  ViewController.swift
//  collectionViewTest
//
//  Created by Christoph Labacher on 08.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	var collectionView: UICollectionView?
	var dataArray: NSArray?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadImages()
		
		// Do any additional setup after loading the view, typically from a nib.
		
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: 375, height: 440)
		layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		layout.minimumLineSpacing = 0
		layout.minimumInteritemSpacing = 0

		collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
		collectionView!.showsHorizontalScrollIndicator = false
		collectionView!.pagingEnabled = true;
		collectionView!.dataSource = self
		collectionView!.delegate = self
		collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		collectionView!.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(collectionView!)
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
 
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
		cell.imageView.image = UIImage(named: String(self.dataArray![indexPath.item] as! NSString))
		cell.textLabel.text = String(self.dataArray![indexPath.item] as! NSString)	
		
		return cell
	}
	
	func loadImages()	{
		let sourcePath = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("Assets")
		self.dataArray = NSFileManager.defaultManager().contentsOfDirectoryAtPath(sourcePath!, error: nil)
	}
}

