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
		
		// ScrollCollectionView
		//////////////////////////
		
		let scrollCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		scrollCollectionViewLayout.itemSize = CGSize(width: 100, height: 100)
		scrollCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		scrollCollectionViewLayout.minimumLineSpacing = 20
		
		scrollCollectionView = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.width, 160), collectionViewLayout: scrollCollectionViewLayout)
		scrollCollectionView!.dataSource = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.delegate = scrollCollectionViewDelegateAndDataSource
		scrollCollectionView!.delaysContentTouches = true
		scrollCollectionView!.showsHorizontalScrollIndicator = false
		scrollCollectionView!.registerClass(ScrollCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		scrollCollectionView!.contentInset = UIEdgeInsetsMake(0, 20, 10, 20)

		scrollCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)

		topView.addSubview(scrollCollectionView!)
		
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
		mainCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		self.view.addSubview(mainCollectionView!)
		
		//////////////////////////
		// CONSTRAINTS
		//////////////////////////
		
		// topView - Width
		let topViewWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(topView))
		self.view.addConstraints(topViewWidthContraint)
		
		// ScrollCollectionView - Width
		let scrollCollectionViewWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(scrollCollectionView!))
		topView.addConstraints(scrollCollectionViewWidthContraint)

		// ScrollCollectionView - Height
		let scrollCollectionViewHeightContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(scrollCollectionView!))
		topView.addConstraints(scrollCollectionViewHeightContraint)

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
		let verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-(30)-[topView(110)][scrubbingHandle(40)][mainCollectionView]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
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
	
	func dictionaryOfNames(arr:UIView...) -> Dictionary<String,UIView> {
		var d = Dictionary<String,UIView>()
		for (ix,v) in enumerate(arr) {
			d["v\(ix+1)"] = v
		}
		return d
	}

}

