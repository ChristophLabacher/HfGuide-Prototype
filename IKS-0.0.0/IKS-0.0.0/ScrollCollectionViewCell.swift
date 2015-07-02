//
//  ScrollCollectionViewCell.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ScrollCollectionViewCell: UICollectionViewCell {
	var data : Card!
	var cardColor : UIColor = UIColor.grayColor()
	
	let card : UIView!
	let imageView: UIImageView!
		
	let borderTop : UIView = UIView()
	let borderRight : UIView = UIView()
	let borderBottom : UIView = UIView()
	let borderLeft : UIView = UIView()
	
	let blurEffectView : UIVisualEffectView!

	
	override init(frame: CGRect) {
		
		card = UIView();
		card.backgroundColor = UIColor.whiteColor();
		card.layer.cornerRadius = 4;
		card.clipsToBounds = true
		card.setTranslatesAutoresizingMaskIntoConstraints(false)
		card.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
		card.alpha = 0.3
		
		imageView = UIImageView()
		imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
		imageView.contentMode = UIViewContentMode.ScaleAspectFill
		imageView.clipsToBounds = true
		card.addSubview(imageView)
		
		let borderWidth : CGFloat = 3.0
		
		borderTop.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
		borderTop.backgroundColor = appColorBlue
		card.addSubview(borderTop)
		
		borderRight.frame = CGRect(x: frame.size.width - borderWidth, y: borderWidth, width: borderWidth, height: frame.size.height - (borderWidth*2))
		borderRight.backgroundColor = appColorBlue
		card.addSubview(borderRight)
		
		borderBottom.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
		borderBottom.backgroundColor = appColorBlue
		card.addSubview(borderBottom)
		
		borderLeft.frame = CGRect(x: 0, y: borderWidth, width: borderWidth, height: frame.size.height - (borderWidth*2))
		borderLeft.backgroundColor = appColorBlue
		card.addSubview(borderLeft)
		
		borderTop.backgroundColor = UIColor.clearColor()
		borderBottom.backgroundColor = UIColor.clearColor()
		borderLeft.backgroundColor = UIColor.clearColor()
		borderRight.backgroundColor = UIColor.clearColor()
		
		// Card > BlurEffect
		//////////////////////////
		
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
		blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = card.frame
	//	blurEffectView.setTranslatesAutoresizingMaskIntoConstraints(false)
		card.addSubview(blurEffectView)
		
		super.init(frame: frame)
		contentView.addSubview(card)
	}
	
	func initCard()	{
		cardColor = colors[data!.type]!
		
		imageView.image = UIImage(named: data!.coverImage)
		
		borderTop.backgroundColor = cardColor
		borderLeft.backgroundColor = cardColor
		borderRight.backgroundColor = cardColor
		borderBottom.backgroundColor = cardColor

	}
	
	func becameActive()	{
		UIView.animateWithDuration(0.8, animations: {
			self.blurEffectView.alpha = 0
		})
	}
	
	
	func wasRead()	{
		UIView.animateWithDuration(0.8, animations: {
			self.borderTop.backgroundColor = UIColor.clearColor()
			self.borderLeft.backgroundColor = UIColor.clearColor()
			self.borderRight.backgroundColor = UIColor.clearColor()
		})
	}
	
	func wasSelected()	{
		UIView.animateWithDuration(0.8, animations: {
			self.card.alpha = 1
		})
	}
	
	func wasDeselected()	{
		UIView.animateWithDuration(0.8, animations: {
			self.card.alpha = 0.3
		})
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
