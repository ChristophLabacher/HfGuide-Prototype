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
		statisticView.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		let statisticLabel_1_1 : CLLabel = CLLabel()
		statisticLabel_1_1.setLabelText("Fragen")
		statisticLabel_1_1.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_1_1)
		
		let statisticLabel_1_2 : CLLabel = CLLabel()
		statisticLabel_1_2.setLabelText("0")
		statisticLabel_1_2.textColor = appColorBlue
		statisticLabel_1_2.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_1_2)
		
		let statisticLabel_1_3 : CLLabel = CLLabel()
		statisticLabel_1_3.setLabelText("/3")
		statisticLabel_1_3.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_1_3)
		
		let statisticLabel_2_1 : CLLabel = CLLabel()
		statisticLabel_2_1.setLabelText("Räume")
		statisticLabel_2_1.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_2_1)
		
		let statisticLabel_2_2 : CLLabel = CLLabel()
		statisticLabel_2_2.setLabelText("3")
		statisticLabel_2_2.textColor = appColorYellow
		statisticLabel_2_2.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_2_2)
		
		let statisticLabel_2_3 : CLLabel = CLLabel()
		statisticLabel_2_3.setLabelText("/5")
		statisticLabel_2_3.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_2_3)
		
		let statisticLabel_3_1 : CLLabel = CLLabel()
		statisticLabel_3_1.setLabelText("Projekte")
		statisticLabel_3_1.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_3_1)
		
		let statisticLabel_3_2 : CLLabel = CLLabel()
		statisticLabel_3_2.setLabelText("2")
		statisticLabel_3_2.textColor = appColorRed
		statisticLabel_3_2.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_3_2)
		
		let statisticLabel_3_3 : CLLabel = CLLabel()
		statisticLabel_3_3.setLabelText("/4")
		statisticLabel_3_3.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_3_3)
		
		let statisticViewDictionary = [
			"statisticLabel_1_1": statisticLabel_1_1,
			"statisticLabel_1_2": statisticLabel_1_2,
			"statisticLabel_1_3": statisticLabel_1_3,
			"statisticLabel_2_1": statisticLabel_2_1,
			"statisticLabel_2_2": statisticLabel_2_2,
			"statisticLabel_2_3": statisticLabel_2_3,
			"statisticLabel_3_1": statisticLabel_3_1,
			"statisticLabel_3_2": statisticLabel_3_2,
			"statisticLabel_3_3": statisticLabel_3_3
		]
		
		// Horizontal
		let statisticViewHorizontalConstraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-30-[statisticLabel_1_1]-5-[statisticLabel_1_2]-0-[statisticLabel_1_3]-(>=0)-[statisticLabel_2_1]-5-[statisticLabel_2_2]-0-[statisticLabel_2_3]-(>=0)-[statisticLabel_3_1]-5-[statisticLabel_3_2]-0-[statisticLabel_3_3]-30-|", options: NSLayoutFormatOptions(0), metrics: nil, views: statisticViewDictionary)
		statisticView.addConstraints(statisticViewHorizontalConstraint)

		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_2_1, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: -15))

		// Vertical
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_1_1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_1_2, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_1_3, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_2_1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_2_2, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_2_3, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_3_1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_3_2, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
		statisticView.addConstraint(NSLayoutConstraint(item: statisticLabel_3_3, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: statisticView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))

		
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
		
		let topViewDictionary = [
			"statisticView": statisticView,
			"scrollCollectionView" : scrollCollectionView!
		]
		
		// Vertical
		let topViewVerticalConstraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-35-[statisticView(20)]-15-[scrollCollectionView(90)]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: topViewDictionary)
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

