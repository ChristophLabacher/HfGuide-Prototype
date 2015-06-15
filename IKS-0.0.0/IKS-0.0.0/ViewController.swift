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
		
		//////////////////////////
		// TOPVIEW
		//////////////////////////
		
		let topView : UIView = UIView()
		topView.setTranslatesAutoresizingMaskIntoConstraints(false)
	
		view.self.addSubview(topView)
		
		let backgroundImage = UIImageView()
		backgroundImage.image = UIImage(named: "overlay")
		backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
		backgroundImage.clipsToBounds = true
		backgroundImage.setTranslatesAutoresizingMaskIntoConstraints(false)

		topView.addSubview(backgroundImage)
		
		// TopView > StatisticView
		//////////////////////////
		
		let statisticView : UIView = UIView()
		//statisticView.backgroundColor = appColorViolet
		statisticView.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		topView.addSubview(statisticView)
		
		// TopView > ScrollCollectionView
		//////////////////////////
		
		let scrollCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		scrollCollectionViewLayout.itemSize = CGSize(width: 90, height: 90)
		scrollCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		scrollCollectionViewLayout.minimumLineSpacing = 14
		
		scrollCollectionView = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: scrollCollectionViewLayout)
		scrollCollectionView!.dataSource = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.delegate = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.delaysContentTouches = true
		scrollCollectionView!.showsHorizontalScrollIndicator = false
		scrollCollectionView!.backgroundColor = UIColor.clearColor()
		scrollCollectionView!.registerClass(ScrollCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		scrollCollectionView!.contentInset = UIEdgeInsetsMake(0, 14, 0, 14)

		scrollCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)

		topView.addSubview(scrollCollectionView!)
		
		//////////////////////////
		// CONSTRAINTS (to topView)
		//////////////////////////
		
		// BackgroundImage - Width
		let backgroundImageWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(backgroundImage))
		topView.addConstraints(backgroundImageWidthContraint)
		
		// BackgroundImage - Height
		let backgroundImageHeightContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(backgroundImage))
		topView.addConstraints(backgroundImageHeightContraint)
		
		// StatisticView - Width
		let statisticViewWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(statisticView))
		topView.addConstraints(statisticViewWidthContraint)
		
		// ScrollCollectionView - Width
		let scrollCollectionViewWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(scrollCollectionView!))
		topView.addConstraints(scrollCollectionViewWidthContraint)
		
		let topViewsDictionary = [
			"statisticView": statisticView,
			"scrollCollectionView" : scrollCollectionView!
		]
		
		// Vertical
		let topViewVerticalConstraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[statisticView(20)]-10-[scrollCollectionView(90)]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: topViewsDictionary)
		topView.addConstraints(topViewVerticalConstraint)
		
		//////////////////////////
		// SCRUBBING HANDLE
		//////////////////////////
		
		let scrubbingHandle : UIImageView = UIImageView()
		scrubbingHandle.contentMode = UIViewContentMode.Center
		scrubbingHandle.image = UIImage(named: "handle")
		scrubbingHandle.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		self.view.addSubview(scrubbingHandle)
		
		//////////////////////////
		// MAINVIEW
		//////////////////////////
		
		
		// MainCollectionView
		//////////////////////////
		
		let mainCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		mainCollectionViewLayout.itemSize = CGSize(width: self.view.frame.width - 90, height: self.view.frame.height-240)
		mainCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		mainCollectionViewLayout.minimumLineSpacing = 22
		
		mainCollectionView = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: mainCollectionViewLayout)
		mainCollectionView!.showsHorizontalScrollIndicator = false
		mainCollectionView!.pagingEnabled = true;
		mainCollectionView!.dataSource = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.delegate = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.registerClass(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		//mainCollectionView?.backgroundColor = appColorGreen
		mainCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)
		mainCollectionView!.contentInset = UIEdgeInsetsMake(0, 45, 0, 45)
		
		self.view.addSubview(mainCollectionView!)
		
		//////////////////////////
		// CONSTRAINTS (to Superview)
		//////////////////////////
		
		// topView - Width
		let topViewWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(topView))
		self.view.addConstraints(topViewWidthContraint)

		// ScrubbingHandle - Width
		let scrubbingHandleWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(scrubbingHandle))
		self.view.addConstraints(scrubbingHandleWidthContraint)
		
		// MainCollectionView - Width
		let mainCollectionViewWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(mainCollectionView!))
		self.view.addConstraints(mainCollectionViewWidthContraint)
		
		let viewsDictionary = [
			"topView": topView,
			"scrubbingHandle" : scrubbingHandle,
			"mainCollectionView": mainCollectionView!
		]
		
		// Vertical
		let verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-(0)-[topView(160)]-5-[scrubbingHandle(40)]-5-[mainCollectionView]-30-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
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

