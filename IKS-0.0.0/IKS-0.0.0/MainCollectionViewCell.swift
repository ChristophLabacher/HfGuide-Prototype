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
	let readMoreButton : UIButton!
	let readMoreButtonLabel : CLLabel!
	let categoryLabel : CLLabel!
	let noteLabel : CLLabel!
	let titelLabel : CLLabel!
	let subtitelLabel : CLLabel!
	
    let detailWebView : UIWebView!
	let detailBackButton : UIButton!
	let detailBackButtonLabel : CLLabel!
	
	var verticalContraint : [AnyObject]!
	var titelLabelVerticalConstraint : NSLayoutConstraint!
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
		backgroundImage.alpha = 0.25
		backgroundImage.clipsToBounds = true
		backgroundImage.setTranslatesAutoresizingMaskIntoConstraints(false)

		card.addSubview(backgroundImage)
		
		let backgroundImageWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|[v1]|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(backgroundImage))
		card.addConstraints(backgroundImageWidthContraint)
		
		// Card > TitelLabel
		//////////////////////////
		
		titelLabel = CLLabel()
		titelLabel.font = UIFont(name: "SourceSansPro-Bold", size: 34)
		titelLabel.numberOfLines = 0;
		titelLabel.textAlignment = NSTextAlignment.Center
		titelLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		card.addSubview(titelLabel)
		
		let horizontalTitelLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[v1]-15-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(titelLabel))
		card.addConstraints(horizontalTitelLabelContraint)
		
		card.addConstraint(NSLayoutConstraint(item: titelLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		
		titelLabelVerticalConstraint = NSLayoutConstraint(item: titelLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -20)
		card.addConstraint(titelLabelVerticalConstraint)
		
		// Card > SubtitelLabel
		//////////////////////////
		
		subtitelLabel = CLLabel()
		subtitelLabel.font = UIFont(name: "SourceSansPro-Regular", size: 24)
		subtitelLabel.numberOfLines = 0;
		subtitelLabel.textAlignment = NSTextAlignment.Center
		subtitelLabel.alpha = 0.5;
		subtitelLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		card.addSubview(subtitelLabel)
		
		let horizontalSubtitelLabelContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[v1]-15-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(subtitelLabel))
		card.addConstraints(horizontalSubtitelLabelContraint)
		
		card.addConstraint(NSLayoutConstraint(item: subtitelLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: titelLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 3))

		
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
		readMoreButtonLabel.setLabelTextWithKerning("Neue Stichworte")
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
		
		// Card > DetailBackButton
		//////////////////////////
		
		detailBackButton = UIButton()
		detailBackButton.setTranslatesAutoresizingMaskIntoConstraints(false)
		detailBackButton.alpha = 0;
		
		card.addSubview(detailBackButton)
		
		card.addConstraint(NSLayoutConstraint(item: detailBackButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 10))
		
		let horizontalDdetailBackButtonContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[v1]", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(detailBackButton))
		card.addConstraints(horizontalDdetailBackButtonContraint)
		
		
		// Card > DetailBackButton > DetailBackButtonLabel
		//////////////////////////
		
		detailBackButtonLabel = CLLabel()
		detailBackButtonLabel.setLabelTextWithKerning("Zurück")
		detailBackButtonLabel.textColor = cardColor
		detailBackButtonLabel.textAlignment = NSTextAlignment.Center
		detailBackButtonLabel.userInteractionEnabled = false;
		
		detailBackButton.addSubview(detailBackButtonLabel)
		detailBackButtonLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		let detailBackButtonLabelWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-[v1]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(detailBackButtonLabel))
		
		let detailBackButtonLabelHeightContraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-[v1]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(detailBackButtonLabel))
		
		detailBackButton.addConstraints(detailBackButtonLabelWidthContraint)
		detailBackButton.addConstraints(detailBackButtonLabelHeightContraint)
		
		// Card > WebView
		//////////////////////////
        detailWebView = UIWebView()
        detailWebView.setTranslatesAutoresizingMaskIntoConstraints(false)

        detailWebView.backgroundColor = UIColor.whiteColor()
		detailWebView.scrollView.bounces = false
        
        card.addSubview(detailWebView)

        let horizontalDetailWebViewContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(detailWebView))
        card.addConstraints(horizontalDetailWebViewContraint)
		
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
            "detailWebView":detailWebView,
			"card":card
		]

		verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage][readMoreButtonBorderTop(5)][readMoreButton(45)][detailWebView(60)]-(-60)-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
		card.addConstraints(verticalContraint)
		
		//////////////////////////
		// Actions
		//////////////////////////
		detailBackButton.addTarget(self, action: "detailBackButtonTap:", forControlEvents: UIControlEvents.TouchUpInside)
		readMoreButton.addTarget(self, action: "readMoreButtonTap:", forControlEvents: UIControlEvents.TouchUpInside)
	}
	
	func initCard()	{
		cardColor = colors[data!.type]!
		
		titelLabel.setLabelTextWithLineHeight(data!.title)
		subtitelLabel.setLabelTextWithLineHeight(data!.subtitle)
		backgroundImage.image = UIImage(named: data!.coverImage)
		categoryLabel.setLabelTextWithKerning(data!.type)
		
		readMoreButtonBorderTop.backgroundColor = cardColor
		self.readMoreButtonLabel.textColor = cardColor
		self.detailBackButtonLabel.textColor = cardColor
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	func readMoreButtonTap(sender: UIButton)	{
		
		if self.data.active {			
			NSNotificationCenter.defaultCenter().postNotificationName("cardTransitionToDetail", object: nil, userInfo: ["cardId" : self.data.id as Int])
			
			self.data.read = true
			self.data.reading = true
            
            let localfilePath = NSBundle.mainBundle().URLForResource(data!.detailSlide, withExtension: "html");

            let requestObj = NSURLRequest(URL: localfilePath!)
            
			self.detailWebView.loadRequest(requestObj)
			
			self.viewsDictionary = [
				"backgroundImage": self.backgroundImage,
				"readMoreButton": self.readMoreButton,
				"readMoreButtonBorderTop": self.readMoreButtonBorderTop,
				"contentView": self.contentView,
				"detailWebView": self.detailWebView
			]
			
			self.card.removeConstraints(self.verticalContraint!)
			self.verticalContraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage][readMoreButtonBorderTop(0)][readMoreButton(0)][detailWebView(0)]|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
			self.card.addConstraints(self.verticalContraint!)
			self.card.layoutIfNeeded()	
			
			self.card.removeConstraints(self.verticalContraint!)
			self.verticalContraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage(100)][readMoreButtonBorderTop(0)][readMoreButton(0)][detailWebView]-(0)-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
			self.card.addConstraints(self.verticalContraint!)
			
			self.titelLabelVerticalConstraint.constant = 10
			
			UIView.animateWithDuration(0.8, animations: {
				self.card.layoutIfNeeded()
				self.card.layer.cornerRadius = 0
				
				self.categoryLabel.alpha = 0
				self.noteLabel.alpha = 0
				self.detailBackButton.alpha = 1
				self.titelLabel.font = UIFont(name: "SourceSansPro-Bold", size: 24)
				self.subtitelLabel.alpha = 0
			}, completion: nil)
		}
	}
	
	func detailBackButtonTap(sender: UIButton)	{
		
		if self.data.reading {
			NSNotificationCenter.defaultCenter().postNotificationName("cardTransitionToMainScroll", object: nil, userInfo: ["cardId" : self.data.id as Int])
			
			self.data.reading = false
			
			viewsDictionary = [
				"backgroundImage": self.backgroundImage,
				"readMoreButton": self.readMoreButton,
				"readMoreButtonBorderTop": self.readMoreButtonBorderTop,
				"contentView": self.contentView,
				"detailWebView": self.detailWebView
			]
			
			self.card.removeConstraints(self.verticalContraint!)
			self.verticalContraint =	NSLayoutConstraint.constraintsWithVisualFormat("V:|[backgroundImage][readMoreButtonBorderTop(5)][readMoreButton(45)][detailWebView(50)]-(-50)-|", options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
			self.card.addConstraints(self.verticalContraint!)
		
			self.titelLabelVerticalConstraint.constant = -20
			
			UIView.animateWithDuration(0.8, animations: {
				self.card.layoutIfNeeded()
				self.card.layer.cornerRadius = 10
				
				self.categoryLabel.alpha = 1
				self.noteLabel.alpha = 1
				self.detailBackButton.alpha = 0
				self.titelLabel.font = UIFont(name: "SourceSansPro-Bold", size: 34)
				self.subtitelLabel.alpha = 0.5
			}, completion: nil)
		}
	}
	
	func becameActive()	{
		UIView.animateWithDuration(0.8, animations: {
			self.blurEffectView.alpha = 0
			}, completion: { (finished : Bool) in
			self.blurEffectView.removeFromSuperview()
		})
		
		readMoreButtonLabel.setLabelTextWithKerning("Weiterlesen")
	}

}
