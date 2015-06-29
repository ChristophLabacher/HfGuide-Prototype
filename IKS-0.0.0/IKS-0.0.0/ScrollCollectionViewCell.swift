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

	
	override init(frame: CGRect) {
		
		card = UIView();
		card.backgroundColor = UIColor.whiteColor();
		card.layer.cornerRadius = 5;
		card.clipsToBounds = true
		card.setTranslatesAutoresizingMaskIntoConstraints(false)
		card.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
		card.alpha = 0.3
		
		imageView = UIImageView()
		imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
		imageView.contentMode = UIViewContentMode.ScaleAspectFill
		imageView.clipsToBounds = true
		card.addSubview(imageView)
		
		let borderWidth : CGFloat = 5.0
		
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
		
		borderLeft.backgroundColor = UIColor.clearColor()
		borderRight.backgroundColor = UIColor.clearColor()
		
		super.init(frame: frame)
		contentView.addSubview(card)
	}
	
	func initCard()	{
		cardColor = colors[data!.type]!
		
		imageView.image = UIImage(named: data!.coverImage)
		borderTop.backgroundColor = cardColor
		borderBottom.backgroundColor = cardColor
	}
	
	func becameActive()	{
		card.alpha = 1
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
