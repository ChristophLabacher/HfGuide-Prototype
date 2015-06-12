//
//  mainCollectionViewCell.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
	let card: UIView!
	let backgroundImage: UIImageView!
	
	override init(frame: CGRect) {
		card = UIView();
		card.backgroundColor = UIColor.whiteColor();
		card.layer.cornerRadius = 10;
		card.frame = CGRect(x: 20, y: 0, width: frame.size.width-40, height: frame.size.height)
		card.clipsToBounds = true
		
		backgroundImage = UIImageView()
		backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
		backgroundImage.clipsToBounds = true
		card.addSubview(backgroundImage)
		
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = card.bounds
		//card.addSubview(blurEffectView)
		
		let readMoreButtonBorderTop = UIView()
		readMoreButtonBorderTop.backgroundColor = UIColor.redColor()
		card.addSubview(readMoreButtonBorderTop)
		
		let readMoreButton = UIButton()
		readMoreButton.setTitle("Weiter lesen", forState: UIControlState.Normal)
		readMoreButton.backgroundColor = UIColor.whiteColor()
		readMoreButton.setTitleColor(UIColor.redColor(), forState:UIControlState.Normal)
		card.addSubview(readMoreButton)
		
		let categoryLabel = UILabel()
		categoryLabel.text = "Frage"
		categoryLabel.textColor = UIColor.whiteColor()
		card.addSubview(categoryLabel)
		
		let noteLabel = UILabel()
		noteLabel.text = "Notizen 5"
		noteLabel.textColor = UIColor.whiteColor()
		card.addSubview(noteLabel)
		
		// Constraints
		
		let viewsDictionary = [
			"backgroundImage": backgroundImage,
			"readMoreButton": readMoreButton,
			"readMoreButtonBorderTop": readMoreButtonBorderTop,
			"categoryLabel": categoryLabel,
			"noteLabel": noteLabel
		]
		
		backgroundImage.setTranslatesAutoresizingMaskIntoConstraints(false)
		readMoreButton.setTranslatesAutoresizingMaskIntoConstraints(false)
		readMoreButtonBorderTop.setTranslatesAutoresizingMaskIntoConstraints(false)
		categoryLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		noteLabel.setTranslatesAutoresizingMaskIntoConstraints(false)

		
		let backgroundImageWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|[backgroundImage]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let readMoreButtonWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[readMoreButton]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let readMoreButtonTopBorderWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[readMoreButtonBorderTop]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage][readMoreButtonBorderTop(4)][readMoreButton(50)]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let verticalCategoryLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-15-[categoryLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		let horizontalCategoryLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[categoryLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		let verticalNoteLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-15-[noteLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		let horizontalNoteLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:[noteLabel]-20-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)


		card.addConstraints(backgroundImageWidthContraint)
		card.addConstraints(readMoreButtonWidthContraint)
		card.addConstraints(readMoreButtonTopBorderWidthContraint)
		card.addConstraints(verticalContraint)
		
		card.addConstraints(verticalCategoryLabelContraint)
		card.addConstraints(horizontalCategoryLabelContraint)
		card.addConstraints(verticalNoteLabelContraint)
		card.addConstraints(horizontalNoteLabelContraint)

		super.init(frame: frame)
		contentView.addSubview(card)
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
