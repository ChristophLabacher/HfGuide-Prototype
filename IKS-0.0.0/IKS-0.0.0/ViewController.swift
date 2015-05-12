//
//  ViewController.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var mainCollectionView:UICollectionView?
	var dataArray:NSArray?
	var delegateAndDataSource = MainCollectionViewController()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		loadImagesFromAssets()
		
		let mainCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		mainCollectionViewLayout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
		mainCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		mainCollectionViewLayout.minimumLineSpacing = 0
		mainCollectionViewLayout.minimumInteritemSpacing = 0
		
		self.mainCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: mainCollectionViewLayout)
		self.mainCollectionView!.showsHorizontalScrollIndicator = false
		self.mainCollectionView!.pagingEnabled = true;
		self.mainCollectionView!.dataSource = delegateAndDataSource
		self.mainCollectionView!.delegate = delegateAndDataSource
		self.mainCollectionView!.backgroundColor = UIColor.whiteColor()
		self.mainCollectionView!.registerClass(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		self.view.addSubview(self.mainCollectionView!)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func loadImagesFromAssets()	{
		let sourcePath = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("Assets")
		self.dataArray = NSFileManager.defaultManager().contentsOfDirectoryAtPath(sourcePath!, error: nil)
	}
}

