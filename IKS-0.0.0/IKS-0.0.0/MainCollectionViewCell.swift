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
	let keywordView: UIView!
	var keywordCounter = 0
	let keywordLabelMinus2 : CLLabel!
	let keywordLabelMinus2Constraint : NSLayoutConstraint!
	let keywordLabelMinus1 : CLLabel!
	let keywordLabelMinus1Constraint : NSLayoutConstraint!
	let keywordLabel0 : CLLabel!
	let keywordLabel0Constraint : NSLayoutConstraint!
	let keywordLabel1 : CLLabel!
	let keywordLabel1Constraint : NSLayoutConstraint!
	let keywordLabel2 : CLLabel!
	let keywordLabel2Constraint : NSLayoutConstraint!
	let keywordLabel3 : CLLabel!
	let keywordLabel3Constraint : NSLayoutConstraint!
	let keywordLabel4 : CLLabel!
	let keywordLabel4Constraint : NSLayoutConstraint!
	let keywordLabel5 : CLLabel!
	let keywordLabel5Constraint : NSLayoutConstraint!
	let keywordLabel6 : CLLabel!
	let keywordLabel6Constraint : NSLayoutConstraint!
	let keywordLabel7 : CLLabel!
	let keywordLabel7Constraint : NSLayoutConstraint!

	let bewerbungImage : UIImageView!
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
		
		
		// Card > BewerbungImage
		//////////////////////////
		
		bewerbungImage = UIImageView()
		bewerbungImage.image = UIImage(named: "bewerbung-overlay")
		bewerbungImage.contentMode = UIViewContentMode.ScaleAspectFill
		bewerbungImage.clipsToBounds = true
		bewerbungImage.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		card.addSubview(bewerbungImage)
		
		let bewerbungImageWidthContraint =	NSLayoutConstraint.constraintsWithVisualFormat("H:|[v1]|", options: NSLayoutFormatOptions(0), metrics: nil, views: dictionaryOfNames(bewerbungImage))
		card.addConstraint(NSLayoutConstraint(item: bewerbungImage, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
		card.addConstraints(bewerbungImageWidthContraint)
		
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
		
		card.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
		card.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
		
		// Card > keywordView
		//////////////////////////
		
		keywordView = UIView()
		keywordView.clipsToBounds = true
		keywordView.setTranslatesAutoresizingMaskIntoConstraints(false)
		card.addSubview(keywordView)
		
		card.addConstraint(NSLayoutConstraint(item: keywordView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
		card.addConstraint(NSLayoutConstraint(item: keywordView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: backgroundImage, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
		
		keywordLabelMinus2 = CLLabel()
		keywordLabelMinus2.textColor = UIColor.whiteColor()
		keywordLabelMinus2.font = UIFont(name: "SourceSansPro-Bold", size: 30)
		keywordLabelMinus2.numberOfLines = 0;
		keywordLabelMinus2.textAlignment = NSTextAlignment.Center
		keywordLabelMinus2.alpha = 1
		keywordLabelMinus2.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabelMinus2.setLabelTextWithLineHeight("Technologie")
		keywordView.addSubview(keywordLabelMinus2)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabelMinus2, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		
		keywordLabelMinus2Constraint = NSLayoutConstraint(item: keywordLabelMinus2, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 380)
		keywordView.addConstraint(keywordLabelMinus2Constraint)

		
		keywordLabelMinus1 = CLLabel()
		keywordLabelMinus1.textColor = UIColor.whiteColor()
		keywordLabelMinus1.font = UIFont(name: "SourceSansPro-Bold", size: 30)
		keywordLabelMinus1.numberOfLines = 0;
		keywordLabelMinus1.textAlignment = NSTextAlignment.Center
		keywordLabelMinus1.alpha = 1
		keywordLabelMinus1.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabelMinus1.setLabelTextWithLineHeight("Schwierigkeiten")
		keywordView.addSubview(keywordLabelMinus1)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabelMinus1, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		
		keywordLabelMinus1Constraint = NSLayoutConstraint(item: keywordLabelMinus1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 340)
		keywordView.addConstraint(keywordLabelMinus1Constraint)


		
		keywordLabel0 = CLLabel()
		keywordLabel0.textColor = UIColor.whiteColor()
		keywordLabel0.font = UIFont(name: "SourceSansPro-Bold", size: 30)
		keywordLabel0.numberOfLines = 0;
		keywordLabel0.textAlignment = NSTextAlignment.Center
		keywordLabel0.alpha = 1
		keywordLabel0.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel0.setLabelTextWithLineHeight("Prozess")
		keywordView.addSubview(keywordLabel0)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel0, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		
		keywordLabel0Constraint = NSLayoutConstraint(item: keywordLabel0, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 300)
		keywordView.addConstraint(keywordLabel0Constraint)
		
		keywordLabel1 = CLLabel()
		keywordLabel1.textColor = UIColor.whiteColor()
		keywordLabel1.font = UIFont(name: "SourceSansPro-Bold", size: 30)
		keywordLabel1.numberOfLines = 0;
		keywordLabel1.textAlignment = NSTextAlignment.Center
		keywordLabel1.alpha = 1
		keywordLabel1.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel1.setLabelTextWithLineHeight("Zielsetzung")
		keywordView.addSubview(keywordLabel1)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel1, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		
		keywordLabel1Constraint = NSLayoutConstraint(item: keywordLabel1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 30)
		keywordView.addConstraint(keywordLabel1Constraint)
		
		keywordLabel2 = CLLabel()
		keywordLabel2.textColor = UIColor.whiteColor()
		keywordLabel2.font = UIFont(name: "SourceSansPro-Bold", size: 18)
		keywordLabel2.numberOfLines = 0;
		keywordLabel2.textAlignment = NSTextAlignment.Center
		keywordLabel2.alpha = 0.26
		keywordLabel2.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel2.setLabelTextWithLineHeight("Nutzergruppe")
		keywordView.addSubview(keywordLabel2)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel2, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		
		keywordLabel2Constraint = NSLayoutConstraint(item: keywordLabel2, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -20)
		keywordView.addConstraint(keywordLabel2Constraint)

		
		keywordLabel3 = CLLabel()
		keywordLabel3.textColor = UIColor.whiteColor()
		keywordLabel3.font = UIFont(name: "SourceSansPro-Bold", size: 18)
		keywordLabel3.numberOfLines = 0;
		keywordLabel3.textAlignment = NSTextAlignment.Center
		keywordLabel3.alpha = 0.21
		keywordLabel3.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel3.setLabelTextWithLineHeight("Visuelle Gestaltung")
		keywordView.addSubview(keywordLabel3)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel3, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		keywordLabel3Constraint = NSLayoutConstraint(item: keywordLabel3, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -60)
		keywordView.addConstraint(keywordLabel3Constraint)
		
		keywordLabel4 = CLLabel()
		keywordLabel4.textColor = UIColor.whiteColor()
		keywordLabel4.font = UIFont(name: "SourceSansPro-Bold", size: 18)
		keywordLabel4.numberOfLines = 0;
		keywordLabel4.textAlignment = NSTextAlignment.Center
		keywordLabel4.alpha = 0.16
		keywordLabel4.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel4.setLabelTextWithLineHeight("Recherche")
		keywordView.addSubview(keywordLabel4)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel4, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		
		keywordLabel4Constraint = NSLayoutConstraint(item: keywordLabel4, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -100)
		keywordView.addConstraint(keywordLabel4Constraint)
		
		keywordLabel5 = CLLabel()
		keywordLabel5.textColor = UIColor.whiteColor()
		keywordLabel5.font = UIFont(name: "SourceSansPro-Bold", size: 18)
		keywordLabel5.numberOfLines = 0;
		keywordLabel5.textAlignment = NSTextAlignment.Center
		keywordLabel5.alpha = 0.11
		keywordLabel5.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel5.setLabelTextWithLineHeight("Bediensituation")
		keywordView.addSubview(keywordLabel5)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel5, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		keywordLabel5Constraint = NSLayoutConstraint(item: keywordLabel5, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -140)
		keywordView.addConstraint(keywordLabel5Constraint)
		
		keywordLabel6 = CLLabel()
		keywordLabel6.textColor = UIColor.whiteColor()
		keywordLabel6.font = UIFont(name: "SourceSansPro-Bold", size: 18)
		keywordLabel6.numberOfLines = 0;
		keywordLabel6.textAlignment = NSTextAlignment.Center
		keywordLabel6.alpha = 0.06
		keywordLabel6.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel6.setLabelTextWithLineHeight("Mentales Modell")
		keywordView.addSubview(keywordLabel6)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel6, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		keywordLabel6Constraint = NSLayoutConstraint(item: keywordLabel6, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -180)
		keywordView.addConstraint(keywordLabel6Constraint)
		
		keywordLabel7 = CLLabel()
		keywordLabel7.textColor = UIColor.whiteColor()
		keywordLabel7.font = UIFont(name: "SourceSansPro-Bold", size: 18)
		keywordLabel7.numberOfLines = 0;
		keywordLabel7.textAlignment = NSTextAlignment.Center
		keywordLabel7.alpha = 0.01
		keywordLabel7.setTranslatesAutoresizingMaskIntoConstraints(false)
		keywordLabel7.setLabelTextWithLineHeight("Mentales Modell")
		keywordView.addSubview(keywordLabel7)
		
		keywordView.addConstraint(NSLayoutConstraint(item: keywordLabel7, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
		keywordLabel7Constraint = NSLayoutConstraint(item: keywordLabel7, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: keywordView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -220)
		keywordView.addConstraint(keywordLabel7Constraint)
		
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
		readMoreButtonLabel.setLabelTextWithKerning("Neues Stichwort")
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
		
		let localfilePath = NSBundle.mainBundle().URLForResource(data!.detailSlide, withExtension: "html");
		let requestObj = NSURLRequest(URL: localfilePath!)
		self.detailWebView.loadRequest(requestObj)
		
		if !data!.hasKeywords	{
			self.keywordView.removeFromSuperview()
		}
		
		if !(data!.type == "Bewerbung")	{
			self.bewerbungImage.removeFromSuperview()
		}
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	func readMoreButtonTap(sender: UIButton)	{
		
		if self.data.active {			
			NSNotificationCenter.defaultCenter().postNotificationName("cardTransitionToDetail", object: nil, userInfo: ["cardId" : self.data.id as Int])
			
			self.data.read = true
			self.data.reading = true


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
		} else	{
			
			
			self.keywordLabelMinus2.alpha -= 0.05
			self.keywordLabelMinus1.alpha -= 0.05
			self.keywordLabel0.alpha -= 0.05
			self.keywordLabel1.alpha -= 0.05
			self.keywordLabel2.alpha -= 0.05
			self.keywordLabel3.alpha -= 0.05
			self.keywordLabel4.alpha -= 0.05
			self.keywordLabel5.alpha -= 0.05
			self.keywordLabel6.alpha -= 0.05
			self.keywordLabel7.alpha -= 0.05
			
			self.keywordLabelMinus2Constraint.constant -= 40
			self.keywordLabelMinus1Constraint.constant -= 40
			self.keywordLabel0Constraint.constant -= 40
			self.keywordLabel1Constraint.constant -= 40
			self.keywordLabel2Constraint.constant -= 40
			self.keywordLabel3Constraint.constant -= 40
			self.keywordLabel4Constraint.constant -= 40
			self.keywordLabel5Constraint.constant -= 40
			self.keywordLabel6Constraint.constant -= 40
			self.keywordLabel7Constraint.constant -= 40
			
			if (keywordCounter == 0)	{
				self.keywordLabel1.alpha = 0.26
				self.keywordLabel1.font = UIFont(name: "SourceSansPro-Bold", size: 18)
				self.keywordLabel1Constraint.constant = -20
				self.keywordLabel0Constraint.constant = 30
			} else if (keywordCounter == 1)	{
				self.keywordLabel0.alpha = 0.26
				self.keywordLabel0.font = UIFont(name: "SourceSansPro-Bold", size: 18)
				self.keywordLabel0Constraint.constant = -20
				self.keywordLabelMinus1Constraint.constant = 30
			} else if (keywordCounter == 2)	{
				self.keywordLabelMinus1.alpha = 0.26
				self.keywordLabelMinus1.font = UIFont(name: "SourceSansPro-Bold", size: 18)
				self.keywordLabelMinus1Constraint.constant = -20
				self.keywordLabelMinus2Constraint.constant = 30
			}
			
			UIView.animateWithDuration(1.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.05, options: nil, animations:{
				self.keywordView.layoutIfNeeded()
			}, completion: { (finished : Bool) in
				self.keywordCounter++
			})
			
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
		self.keywordView.removeFromSuperview()
	}

}
