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
		
		//////
		// TODO: Cleanup
		//////
		
		//
		// Card
		//
		
		card = UIView();
		card.backgroundColor = UIColor.whiteColor();
		card.layer.cornerRadius = 10;
		card.frame = CGRect(x: 0, y: 0, width: frame.size.width-200, height: frame.size.height-200)
		card.clipsToBounds = true
		
		//
		// BackgroundImage
		//
		
		backgroundImage = UIImageView()
		backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
		backgroundImage.clipsToBounds = true
		card.addSubview(backgroundImage)
		
		//
		// BlurEffect
		//
		
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = card.bounds
		//card.addSubview(blurEffectView)
		
		//
		// ReadMoreButtonBorderTop
		//
		
		let readMoreButtonBorderTop = UIView()
		readMoreButtonBorderTop.backgroundColor = appColorRed
		card.addSubview(readMoreButtonBorderTop)
		
		//
		// ReadMoreButton
		//
		
		let readMoreButton = UIButton()
		readMoreButton.backgroundColor = UIColor.whiteColor()
		card.addSubview(readMoreButton)
		
		let readMoreButtonLabel = CLLabel()
		readMoreButtonLabel.setLabelText("Weiterlesen")
		readMoreButtonLabel.textColor = appColorRed
		readMoreButtonLabel.textAlignment = NSTextAlignment.Center
		readMoreButtonLabel.userInteractionEnabled = false;
		
		readMoreButton.addSubview(readMoreButtonLabel)
		readMoreButtonLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		let readMoreButtonLabelWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-[v1]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(readMoreButtonLabel))
		
		let readMoreButtonLabelHeightContraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[v1]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(readMoreButtonLabel))
		
		readMoreButton.addConstraints(readMoreButtonLabelWidthContraint)
		readMoreButton.addConstraints(readMoreButtonLabelHeightContraint)

		//
		// CategoryLabel
		//
		
		let categoryLabel = CLLabel()
		categoryLabel.setLabelText("Frage")
		card.addSubview(categoryLabel)
		
		//
		// NoteLabel
		//
		
		let noteLabel = CLLabel()
		noteLabel.setLabelText("5 Notizen")
		card.addSubview(noteLabel)
		
		super.init(frame: frame)
		contentView.addSubview(card)
		
		//
		// Constraints
		//
		
		let viewsDictionary = [
			"backgroundImage": backgroundImage,
			"readMoreButton": readMoreButton,
			"readMoreButtonBorderTop": readMoreButtonBorderTop,
			"categoryLabel": categoryLabel,
			"noteLabel": noteLabel,
			"contentView":contentView,
			"card":card
		]
		
		backgroundImage.setTranslatesAutoresizingMaskIntoConstraints(false)
		readMoreButton.setTranslatesAutoresizingMaskIntoConstraints(false)
		readMoreButtonBorderTop.setTranslatesAutoresizingMaskIntoConstraints(false)
		categoryLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		noteLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		card.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		let backgroundImageWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|[backgroundImage]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let readMoreButtonWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[readMoreButton]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let readMoreButtonTopBorderWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[readMoreButtonBorderTop]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage][readMoreButtonBorderTop(5)][readMoreButton(45)]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		
		let verticalCategoryLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[categoryLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		let horizontalCategoryLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[categoryLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		let verticalNoteLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[noteLabel]", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		let horizontalNoteLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:[noteLabel]-15-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)

		card.addConstraints(backgroundImageWidthContraint)
		card.addConstraints(readMoreButtonWidthContraint)
		card.addConstraints(readMoreButtonTopBorderWidthContraint)
		card.addConstraints(verticalContraint)
		
		card.addConstraints(verticalCategoryLabelContraint)
		card.addConstraints(horizontalCategoryLabelContraint)
		card.addConstraints(verticalNoteLabelContraint)
		card.addConstraints(horizontalNoteLabelContraint)
		
		let verticalCardContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[card]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		let horizontalCardContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[card]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)

		contentView.addConstraints(verticalCardContraint)
		contentView.addConstraints(horizontalCardContraint)
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
