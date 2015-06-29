//
//  CLLabel.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 15.06.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class CLLabel: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)
	
		self.textColor = UIColor.whiteColor()
		self.font = UIFont(name: "SourceSansPro-SemiBold", size: 12)
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setLabelTextWithKerning(string: NSString)	{
		let labelText = string.uppercaseString
		let labelAttributedText : NSMutableAttributedString = NSMutableAttributedString(string: labelText)
		
		labelAttributedText.addAttribute(NSKernAttributeName, value: CGFloat(0.6), range: NSRange(location: 0, length: count(labelText)))
		
		self.attributedText = labelAttributedText
	}
	
	func setLabelTextWithLineHeight(string: NSString)	{
		let labelText : String = string as String
		let labelAttributedText : NSMutableAttributedString = NSMutableAttributedString(string: labelText)
		
		var paragraphStyle = NSMutableParagraphStyle()
		//paragraphStyle.lineSpacing = -10.0
		paragraphStyle.lineHeightMultiple = 0.9
		paragraphStyle.alignment = NSTextAlignment.Center
		
		labelAttributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: count(labelText)))
		
		
		self.attributedText = labelAttributedText
	}
}
