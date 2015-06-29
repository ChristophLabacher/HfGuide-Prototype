//
//  mainCollectionViewCell.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
	var data : Card!
	var cardColor : UIColor = UIColor.grayColor()
	
	let card: UIView!
	let backgroundImage: UIImageView!
	let blurEffectView : UIVisualEffectView!
	let readMoreButtonBorderTop : UIView!
//	let readMoreButtonBorderTopProgress : UIView!
	let readMoreButton : UIButton!
	let readMoreButtonLabel : CLLabel!
	let categoryLabel : CLLabel!
	let noteLabel : CLLabel!
	let titelLabel : CLLabel;
	
	var verticalContraint : [AnyObject]!
	var viewsDictionary : [String : UIView]!
		
	override init(frame: CGRect) {
		
		//////////////////////////
		// Card
		//////////////////////////
		
		card = UIView();
		card.backgroundColor = UIColor.blackColor();
		card.layer.cornerRadius = 10;
		card.clipsToBounds = true
		card.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		// Card > BackgroundImage
		//////////////////////////
		
		backgroundImage = UIImageView()
		backgroundImage.contentMode = UIViewContentMode.ScaleAspectFill
		backgroundImage.alpha = 0.8
		backgroundImage.clipsToBounds = true
		backgroundImage.setTranslatesAutoresizingMaskIntoConstraints(false)

		card.addSubview(backgroundImage)
		
		let backgroundImageWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|[v1]|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(backgroundImage))
		card.addConstraints(backgroundImageWidthContraint)
		
		// Card > TitelLabel
		//////////////////////////
		
		titelLabel = CLLabel()
		titelLabel.font = UIFont(name: "SourceSansPro-Bold", size: 30)
		titelLabel.numberOfLines = 0;
		titelLabel.textAlignment = NSTextAlignment.Center
		titelLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		card.addSubview(titelLabel)
		
		let horizontalTitelLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[v1]-15-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(titelLabel))
		card.addConstraints(horizontalTitelLabelContraint)
		
		card.addConstraint(NSLayoutConstraint(item: titelLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: card, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		card.addConstraint(NSLayoutConstraint(item: titelLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: card, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -40))
		
		// Card > BlurEffect
		//////////////////////////
		
		let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
		blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.setTranslatesAutoresizingMaskIntoConstraints(false)
		card.addSubview(blurEffectView)
		
		card.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: card, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
		card.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: card, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
		
		// Card > ReadMoreButtonBorderTop
		//////////////////////////
		
		readMoreButtonBorderTop = UIView()
		readMoreButtonBorderTop.backgroundColor = cardColor
		readMoreButtonBorderTop.setTranslatesAutoresizingMaskIntoConstraints(false)

		card.addSubview(readMoreButtonBorderTop)
		
		let readMoreButtonTopBorderWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[v1]|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(readMoreButtonBorderTop))
		card.addConstraints(readMoreButtonTopBorderWidthContraint)
		
//		readMoreButtonBorderTopProgress = UIView()
//		readMoreButtonBorderTopProgress.backgroundColor = cardColor
//		readMoreButtonBorderTop.addSubview(readMoreButtonBorderTopProgress)

		// Card > ReadMore
		//////////////////////////
		
		readMoreButton = UIButton()
		readMoreButton.backgroundColor = UIColor.whiteColor()
		readMoreButton.setTranslatesAutoresizingMaskIntoConstraints(false)

		card.addSubview(readMoreButton)
		
		let readMoreButtonWidthContraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|[v1]|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(readMoreButton))
		card.addConstraints(readMoreButtonWidthContraint)
		
		// Card > ReadMore > ReadMoreButtonLabel
		//////////////////////////
		
		readMoreButtonLabel = CLLabel()
		readMoreButtonLabel.setLabelTextWithKerning("Weiterlesen")
		readMoreButtonLabel.textColor = cardColor
		readMoreButtonLabel.textAlignment = NSTextAlignment.Center
		readMoreButtonLabel.userInteractionEnabled = false;
		
		readMoreButton.addSubview(readMoreButtonLabel)
		readMoreButtonLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		let readMoreButtonLabelWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-[v1]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(readMoreButtonLabel))
		
		let readMoreButtonLabelHeightContraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[v1]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(readMoreButtonLabel))
		
		readMoreButton.addConstraints(readMoreButtonLabelWidthContraint)
		readMoreButton.addConstraints(readMoreButtonLabelHeightContraint)

		// Card > CategoryLabel
		//////////////////////////
		
		categoryLabel = CLLabel()
		categoryLabel.setLabelTextWithKerning("")
		categoryLabel.setTranslatesAutoresizingMaskIntoConstraints(false)

		card.addSubview(categoryLabel)
		
		let verticalCategoryLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[v1]", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(categoryLabel))
		card.addConstraints(verticalCategoryLabelContraint)
		
		let horizontalCategoryLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[v1]", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(categoryLabel))
		card.addConstraints(horizontalCategoryLabelContraint)
		
		// Card > NoteLabel
		//////////////////////////
		
		noteLabel = CLLabel()
		noteLabel.setLabelTextWithKerning("Keine Notizen")
		noteLabel.setTranslatesAutoresizingMaskIntoConstraints(false)

		card.addSubview(noteLabel)
		
		let verticalNoteLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[v1]", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(noteLabel))
		card.addConstraints(verticalNoteLabelContraint)
		
		let horizontalNoteLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:[v1]-15-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(noteLabel))
		card.addConstraints(horizontalNoteLabelContraint)
		
		super.init(frame: frame)
		contentView.addSubview(card)
		
		//////////////////////////
		// CONSTRAINTS (to card)
		//////////////////////////
		
		let verticalCardContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(card))
		let horizontalCardContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(card))
		contentView.addConstraints(verticalCardContraint)
		contentView.addConstraints(horizontalCardContraint)
		
		viewsDictionary = [
			"backgroundImage": backgroundImage,
			"readMoreButton": readMoreButton,
			"readMoreButtonBorderTop": readMoreButtonBorderTop,
			"categoryLabel": categoryLabel,
			"noteLabel": noteLabel,
			"titelLabel" : titelLabel,
			"contentView":contentView,
			"card":card
		]

		verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage][readMoreButtonBorderTop(5)][readMoreButton(45)]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		card.addConstraints(verticalContraint)
		
		//////////////////////////
		// Actions
		//////////////////////////
		readMoreButton.addTarget(self, action: "readMoreButtonTap:", forControlEvents: UIControlEvents.TouchUpInside)
	}
	
	func initCard()	{
		cardColor = colors[data!.type]!
		
		titelLabel.setLabelTextWithLineHeight(data!.title)
		backgroundImage.image = UIImage(named: data!.coverImage)
		categoryLabel.setLabelTextWithKerning(data!.type)
		
		readMoreButtonBorderTop.backgroundColor = cardColor
		self.readMoreButtonLabel.textColor = cardColor
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func readMoreButtonTap(sender: UIButton)	{
		NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "cardTransitionToDetail", object: self))
		
		viewsDictionary = [
			"backgroundImage": backgroundImage,
			"readMoreButton": readMoreButton,
			"readMoreButtonBorderTop": readMoreButtonBorderTop,
			"contentView":contentView,
		]
		
		self.card.removeConstraints(self.verticalContraint!)
		self.verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage(120)][readMoreButtonBorderTop(5)][readMoreButton(45)]-(>=0)-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		self.card.addConstraints(self.verticalContraint!)
		
		UIView.animateWithDuration(0.8, animations: {
			self.card.layoutIfNeeded()
			self.card.layer.cornerRadius = 0;
		}, completion: nil)
	}
	
	func becameActive()	{
		UIView.animateWithDuration(0.8, animations: {
			self.blurEffectView.alpha = 0
			}, completion: { (finished : Bool) in
			self.blurEffectView.removeFromSuperview()
		})
	}
}
