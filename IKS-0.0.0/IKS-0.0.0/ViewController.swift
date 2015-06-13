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
		super.view.backgroundColor = UIColor.blackColor()
		
		loadImagesFromAssets()
		
		let scrollCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		scrollCollectionViewLayout.itemSize = CGSize(width: 120, height: 100)
		scrollCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		scrollCollectionViewLayout.minimumLineSpacing = 20
		scrollCollectionViewLayout.minimumInteritemSpacing = 10
		
		scrollCollectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.width, 160), collectionViewLayout: scrollCollectionViewLayout)
		scrollCollectionView!.dataSource = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.delegate = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.delaysContentTouches = true
		scrollCollectionView!.registerClass(ScrollCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		self.view.addSubview(scrollCollectionView!)
		
		let scrubbingHandle : UIImageView = UIImageView()
		scrubbingHandle.contentMode = UIViewContentMode.Center
		scrubbingHandle.image = UIImage(named: "handle")
		self.view.addSubview(scrubbingHandle)
		
		let mainCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		mainCollectionViewLayout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height-250)
		mainCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		mainCollectionViewLayout.minimumLineSpacing = 0
		mainCollectionViewLayout.minimumInteritemSpacing = 0
		
		mainCollectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height-100), collectionViewLayout: mainCollectionViewLayout)
		mainCollectionView!.showsHorizontalScrollIndicator = false
		mainCollectionView!.pagingEnabled = true;
		mainCollectionView!.dataSource = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.delegate = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.registerClass(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		
		mainCollectionView?.backgroundColor = UIColor.greenColor()
		
		self.view.addSubview(mainCollectionView!)
		
		let viewsDictionary = [
				"scrollCollectionView": scrollCollectionView!,
				"mainCollectionView": mainCollectionView!,
				"scrubbingHandle": scrubbingHandle
		]
		
		scrollCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)
		scrubbingHandle.setTranslatesAutoresizingMaskIntoConstraints(false)
		mainCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		let scrollCollectionViewWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollCollectionView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let scrubbingHandleWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrubbingHandle]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let mainCollectionViewWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[mainCollectionView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)

		let verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-(20)-[scrollCollectionView(100)][scrubbingHandle(40)][mainCollectionView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		self.view.addConstraints(scrollCollectionViewWidthContraint)
		self.view.addConstraints(scrubbingHandleWidthContraint)
		self.view.addConstraints(mainCollectionViewWidthContraint)
		self.view.addConstraints(verticalContraint)
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

