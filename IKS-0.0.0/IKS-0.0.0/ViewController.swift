//
//  ViewController.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadImagesFromAssets()
		
		let scrollCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		scrollCollectionViewLayout.itemSize = CGSize(width: 200, height: 200)
		scrollCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		scrollCollectionViewLayout.minimumLineSpacing = 0
		scrollCollectionViewLayout.minimumInteritemSpacing = 0
		
		scrollCollectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.width, 200), collectionViewLayout: scrollCollectionViewLayout)
		scrollCollectionView!.dataSource = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.delegate = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.backgroundColor = UIColor.whiteColor()
		scrollCollectionView!.delaysContentTouches = true
		scrollCollectionView!.registerClass(ScrollCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		self.view.addSubview(scrollCollectionView!)
		
		let scrubbingHandle : UIImageView = UIImageView(frame: CGRectMake(0, 200, self.view.frame.width, 20))
		scrubbingHandle.backgroundColor = UIColor.redColor()
		self.view.addSubview(scrubbingHandle)
		
		let mainCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		mainCollectionViewLayout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height-200)
		mainCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		mainCollectionViewLayout.minimumLineSpacing = 0
		mainCollectionViewLayout.minimumInteritemSpacing = 0
		
		mainCollectionView = UICollectionView(frame: CGRectMake(0, 200, self.view.frame.width, self.view.frame.height-200), collectionViewLayout: mainCollectionViewLayout)
		mainCollectionView!.showsHorizontalScrollIndicator = false
		mainCollectionView!.pagingEnabled = true;
		mainCollectionView!.dataSource = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.delegate = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.backgroundColor = UIColor.whiteColor()
		mainCollectionView!.registerClass(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		self.view.addSubview(mainCollectionView!)
		
		let constrains : [NSLayoutConstraint] = [
			NSLayoutConstraint(item: scrollCollectionView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: scrubbingHandle, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 1),
			NSLayoutConstraint(item: scrubbingHandle, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scrollCollectionView!, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: mainCollectionView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scrubbingHandle, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: mainCollectionView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: mainCollectionView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 1)
		]
		
		mainCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)
		self.view.addConstraints(constrains)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func loadImagesFromAssets()	{
		let sourcePath = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("Assets")
		dataArray = NSFileManager.defaultManager().contentsOfDirectoryAtPath(sourcePath!, error: nil)
		println(dataArray?.count)
	}
}

