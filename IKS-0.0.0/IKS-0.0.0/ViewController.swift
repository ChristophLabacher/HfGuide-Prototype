//
//  ViewController.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit
import AudioToolbox

// TODO: Test

class ViewController: UIViewController, UIScrollViewDelegate {
	
	let topView : UIView! = UIView()
	let scrubbingHandle: UIImageView! = UIImageView()
	var viewsDictionary : [String : UIView]!
	var mainViewVerticalConstraint : [AnyObject]! = nil
	var mainViewTopVerticalConstraint : NSLayoutConstraint!
	var mainViewBottomVerticalConstraint : NSLayoutConstraint!
	var mainCollectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

	override func viewDidLoad() {
		super.viewDidLoad()
		super.view.backgroundColor = UIColor.blackColor()
		
		//////////////////////////
		// MARK: TOPVIEW
		//////////////////////////
		
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
		statisticLabel_1_1.setLabelTextWithKerning("Fragen")
		statisticLabel_1_1.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_1_1)
		
		let statisticLabel_1_2 : CLLabel = CLLabel()
		statisticLabel_1_2.setLabelTextWithKerning("0")
		statisticLabel_1_2.textColor = appColorBlue
		statisticLabel_1_2.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_1_2)
		
		let statisticLabel_1_3 : CLLabel = CLLabel()
		statisticLabel_1_3.setLabelTextWithKerning("/3")
		statisticLabel_1_3.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_1_3)
		
		let statisticLabel_2_1 : CLLabel = CLLabel()
		statisticLabel_2_1.setLabelTextWithKerning("Räume")
		statisticLabel_2_1.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_2_1)
		
		let statisticLabel_2_2 : CLLabel = CLLabel()
		statisticLabel_2_2.setLabelTextWithKerning("3")
		statisticLabel_2_2.textColor = appColorYellow
		statisticLabel_2_2.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_2_2)
		
		let statisticLabel_2_3 : CLLabel = CLLabel()
		statisticLabel_2_3.setLabelTextWithKerning("/5")
		statisticLabel_2_3.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_2_3)
		
		let statisticLabel_3_1 : CLLabel = CLLabel()
		statisticLabel_3_1.setLabelTextWithKerning("Projekte")
		statisticLabel_3_1.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_3_1)
		
		let statisticLabel_3_2 : CLLabel = CLLabel()
		statisticLabel_3_2.setLabelTextWithKerning("2")
		statisticLabel_3_2.textColor = appColorRed
		statisticLabel_3_2.setTranslatesAutoresizingMaskIntoConstraints(false)
		statisticView.addSubview(statisticLabel_3_2)
		
		let statisticLabel_3_3 : CLLabel = CLLabel()
		statisticLabel_3_3.setLabelTextWithKerning("/4")
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

		
		topView!.addSubview(statisticView)
		
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
		scrollCollectionViewDelegateAndDataSource.data = cards

		topView!.addSubview(scrollCollectionView!)
		
		//////////////////////////
		// MARK: CONSTRAINTS (to topView)
		//////////////////////////
		
		// BackgroundImage - Width
		let backgroundImageWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(backgroundImage))
		topView!.addConstraints(backgroundImageWidthContraint)
		
		// BackgroundImage - Height
		let backgroundImageHeightContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(backgroundImage))
		topView!.addConstraints(backgroundImageHeightContraint)
		
		// StatisticView - Width
		let statisticViewWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(statisticView))
		topView!.addConstraints(statisticViewWidthContraint)
		
		// ScrollCollectionView - Width
		let scrollCollectionViewWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(scrollCollectionView!))
		topView!.addConstraints(scrollCollectionViewWidthContraint)
		
		let topViewDictionary = [
			"statisticView": statisticView,
			"scrollCollectionView" : scrollCollectionView!
		]
		
		// Vertical
		let topViewVerticalConstraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-55-[scrollCollectionView(90)]-15-[statisticView(20)]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: topViewDictionary)
		topView!.addConstraints(topViewVerticalConstraint)
		
		//////////////////////////
		// MARK: SCRUBBING HANDLE
		//////////////////////////
		
		scrubbingHandle!.contentMode = UIViewContentMode.Center
		scrubbingHandle!.image = UIImage(named: "handle")
		scrubbingHandle!.setTranslatesAutoresizingMaskIntoConstraints(false)
		scrubbingHandle!.userInteractionEnabled = true
		
		let scrubbingHandleGestureRecognizer = UIPanGestureRecognizer(target: self, action: "panOnScrubbingHandle:")
		scrubbingHandle!.addGestureRecognizer(scrubbingHandleGestureRecognizer)
		
		self.view.addSubview(scrubbingHandle!)
		
		//////////////////////////
		// MARK: MAINVIEW
		//////////////////////////
		
		
		// MainCollectionView
		//////////////////////////
		
		mainCollectionViewLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
		mainCollectionViewLayout.minimumLineSpacing = 22
		
		mainCollectionView = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: mainCollectionViewLayout)
		mainCollectionView!.showsHorizontalScrollIndicator = false
		mainCollectionView!.pagingEnabled = false
		mainCollectionView!.scrollEnabled = false
		mainCollectionView!.dataSource = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.delegate = mainCollectionViewDelegateAndDataSource
		mainCollectionView!.registerClass(MainCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		mainCollectionView!.setTranslatesAutoresizingMaskIntoConstraints(false)
		mainCollectionView!.contentInset = UIEdgeInsetsMake(0, 40, 0, 40)
		
		scrollCollectionViewDelegateAndDataSource.data = cards

		
		self.view.addSubview(mainCollectionView!)

		invisibleScrollView = UIScrollView(frame: CGRectMake((40-11), 0, self.view.frame.width-(80-22), self.view.frame.height))
		//invisibleScrollView?.backgroundColor = UIColor.redColor()
		invisibleScrollView?.contentSize = CGSizeMake(40, 0)
		invisibleScrollView?.pagingEnabled = true
		invisibleScrollView?.userInteractionEnabled = false
		invisibleScrollView?.delegate = self
		
		mainCollectionView!.addGestureRecognizer(invisibleScrollView!.panGestureRecognizer)
		
		self.view.addSubview(invisibleScrollView!)
		
		//////////////////////////
		// MARK: CONSTRAINTS (to Superview)
		//////////////////////////
		
		// topView - Width
		let topViewWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(topView!))
		self.view.addConstraints(topViewWidthContraint)

		// ScrubbingHandle - Width
		let scrubbingHandleWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(scrubbingHandle!))
		self.view.addConstraints(scrubbingHandleWidthContraint)
		
		// MainCollectionView - Width
		let mainCollectionViewWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(mainCollectionView!))
		self.view.addConstraints(mainCollectionViewWidthContraint)
		
		viewsDictionary = [
			"topView": topView!,
			"scrubbingHandle" : scrubbingHandle!,
			"mainCollectionView": mainCollectionView!
		]
	
		// Vertical
		mainViewVerticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[topView(180)]-10-[scrubbingHandle(80)]-0-[mainCollectionView]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary!)
		self.view.addConstraints(mainViewVerticalConstraint!)
		
		mainViewTopVerticalConstraint = NSLayoutConstraint(item: topView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -180)
		self.view.addConstraint(mainViewTopVerticalConstraint!)
		
		mainViewBottomVerticalConstraint = NSLayoutConstraint(item: mainCollectionView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -40)
		self.view.addConstraint(mainViewBottomVerticalConstraint!)

		NSNotificationCenter.defaultCenter().addObserver(self, selector: "cardTransitionToDetail:", name: "cardTransitionToDetail", object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "cardTransitionToMainScroll:", name: "cardTransitionToMainScroll", object: nil)
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "cardBecameActive:", name: "cardBecameActive", object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: "cardBecameVisible:", name: "cardBecameVisible", object: nil)
		
		initFirstCard()
	}
	
	func cardBecameActive(notification: NSNotification)	{
		let info : NSDictionary = notification.userInfo!
		let cardIndex = info.valueForKey("index") as! Int
		
		cards[cardIndex].active = true
		mainCollectionView!.reloadData()
		scrollCollectionView?.reloadData()
		
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
		
		println("Card became active \(cardIndex)")
	}
	
	func cardBecameVisible(notification: NSNotification)	{
		scrollCollectionView?.reloadData()

		let info : NSDictionary = notification.userInfo!
		let cardIndex = info.valueForKey("index") as! Int
		
		cards[cardIndex].visible = true
		
		println("Card became visible \(cardIndex)")
		
		let size = mainCollectionViewDelegateAndDataSource.data.count
		mainCollectionViewDelegateAndDataSource.data.append(cards[cardIndex])
		mainCollectionView!.insertItemsAtIndexPaths([NSIndexPath(forItem: size, inSection: 0)])
		
		var targetPosition = scrollCollectionViewDelegateAndDataSource.visibleItems
		var currentPosition = (scrollCollectionViewDelegateAndDataSource.data as NSArray).indexOfObject(cards[cardIndex])
		
		var me = scrollCollectionViewDelegateAndDataSource.data.removeAtIndex(currentPosition)
		scrollCollectionViewDelegateAndDataSource.data.insert(me, atIndex: targetPosition)
		
		scrollCollectionView?.moveItemAtIndexPath(NSIndexPath(forItem: currentPosition, inSection: 0), toIndexPath: NSIndexPath(forItem: targetPosition, inSection: 0))
		
//		if (scrollCollectionViewDelegateAndDataSource.visibleItems == 0)	{
//			scrollCollectionViewDelegateAndDataSource.data[0].selected = true
//		}
		
		scrollCollectionViewDelegateAndDataSource.visibleItems++
		scrollCollectionView?.reloadData()
		
		invisibleScrollView?.contentSize.width += (self.view.frame.width - 80) + 11
	}
	
	func initFirstCard()	{
		cards[3].visible = true
		cards[3].active = true
		
		let size = mainCollectionViewDelegateAndDataSource.data.count
		mainCollectionViewDelegateAndDataSource.data.append(cards[3])
		mainCollectionView!.reloadData()
		
		var targetPosition = scrollCollectionViewDelegateAndDataSource.visibleItems
		var currentPosition = (scrollCollectionViewDelegateAndDataSource.data as NSArray).indexOfObject(cards[3])
		var me = scrollCollectionViewDelegateAndDataSource.data.removeAtIndex(currentPosition)
		scrollCollectionViewDelegateAndDataSource.data.insert(me, atIndex: targetPosition)
		scrollCollectionViewDelegateAndDataSource.visibleItems++
		scrollCollectionView?.reloadData()
		
		invisibleScrollView?.contentSize.width += (self.view.frame.width - 80) + 11
	}
	
	func cardTransitionToDetail(notification: NSNotification)	{
		currentlyInDetailMode = true
		invisibleScrollView!.pagingEnabled = false
		invisibleScrollView!.scrollEnabled = false
		
		let info : NSDictionary = notification.userInfo!
		let cardId = info.valueForKey("cardId") as! Int
		
		scrollCollectionView?.reloadData()
		
		mainViewTopVerticalConstraint.constant = -180 - 90
		mainViewBottomVerticalConstraint.constant = 0
		mainCollectionViewDelegateAndDataSource.cellMargin = 0
		mainCollectionView!.collectionViewLayout.invalidateLayout()
		//mainCollectionView!.reloadData()
		
		UIView.animateWithDuration(0.8, animations: {
			self.view.layoutIfNeeded()

			var number : CGFloat = CGFloat(currentPage * 80)
			mainCollectionView?.contentOffset.x += number + 40

		}, completion: nil)
	}
	
	func cardTransitionToMainScroll(notification: NSNotification)	{
		currentlyInDetailMode = false
		
		let info : NSDictionary = notification.userInfo!
		let cardId = info.valueForKey("cardId") as! Int
		
		scrollCollectionView?.reloadData()
		
		mainViewTopVerticalConstraint.constant = -180
		mainViewBottomVerticalConstraint.constant = -40
		mainCollectionViewDelegateAndDataSource.cellMargin = 80
		mainCollectionView!.collectionViewLayout.invalidateLayout()
		//mainCollectionView!.reloadData()
		
		UIView.animateWithDuration(0.8, animations: {
			self.view.layoutIfNeeded()
	
			if (currentPage == mainCollectionViewDelegateAndDataSource.data.count - 1 && mainCollectionViewDelegateAndDataSource.data.count > 1)	{
				var number : CGFloat = CGFloat((currentPage - 1) * 80)
				mainCollectionView?.contentOffset.x += number - 40 + 28
				
				println("last card")
			} else	{
				var number : CGFloat = CGFloat(currentPage * 80)
				mainCollectionView?.contentOffset.x -= number + 40
			}
			
			
			if (currentPage == 0 && mainCollectionViewDelegateAndDataSource.data.count == 1)	{
				mainCollectionView?.contentOffset.x += 40
			}
			
		}, completion: { (finished : Bool) in
			invisibleScrollView!.pagingEnabled = true
			invisibleScrollView!.scrollEnabled = true
		})
		
//		var number : CGFloat = CGFloat(currentPage * 80)
//		mainCollectionView?.contentOffset.x -= number + 40
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func panOnScrubbingHandle(sender: UIPanGestureRecognizer)	{
		// TODO: Recalculate
		let top : CGFloat = -180.0;
		let bottom : CGFloat = -20.0;
		var currentPos = mainViewTopVerticalConstraint.constant
		var touchPos = sender.locationInView(self.view).y - 180 - 80
		var duration = 0.0
		var newAlpha : CGFloat = 1
        
		if touchPos <= 0 && touchPos >= -180 {
			currentPos = touchPos
            newAlpha = 0.2 + 0.8 * (currentPos / -180)
        } else if touchPos > 0 {
            newAlpha = 0.2
        }
        
        
		if (sender.state == UIGestureRecognizerState.Ended || sender.state == UIGestureRecognizerState.Cancelled)	{
			if (sender.velocityInView(self.view).y > 0)	{
				// Down
				currentPos = bottom
				newAlpha = 0.2
				
				invisibleScrollView!.pagingEnabled = false
				invisibleScrollView!.scrollEnabled = false
			} else if (sender.velocityInView(self.view).y < 0)	{
				// Up
				currentPos = top
				newAlpha = 1
				
				invisibleScrollView!.pagingEnabled = true
				invisibleScrollView!.scrollEnabled = true
			}
			
			duration = 0.9
		}
		
		mainViewTopVerticalConstraint.constant = currentPos
		mainCollectionView!.reloadData()
		
		UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.01, options: nil, animations: {
			self.view.layoutIfNeeded()
		}, completion: nil)
		
		UIView.animateWithDuration(0, animations: {
			mainCollectionView!.alpha = newAlpha
		})
	}
	
	
	func scrollViewDidScroll(scrollView: UIScrollView) {
		mainCollectionView?.contentOffset = invisibleScrollView!.contentOffset
		mainCollectionView?.contentOffset.x -= mainCollectionView!.contentInset.left
	}
	
	func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		var pageCalc : CGFloat = invisibleScrollView!.contentOffset.x / invisibleScrollView!.frame.size.width
		currentPage = Int(round(pageCalc))

		for card in scrollCollectionViewDelegateAndDataSource.data	{
			card.selected = false
		}
		
		scrollCollectionViewDelegateAndDataSource.data[currentPage].selected = true
		scrollCollectionView?.reloadData()
	}
}

