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
	
	func setLabelText(string: NSString)	{
		let labelText = string.uppercaseString
		let labelAttributedText : NSMutableAttributedString = NSMutableAttributedString(string: labelText)
		
		labelAttributedText.addAttribute(NSKernAttributeName, value: CGFloat(0.6), range: NSRange(location: 0, length: count(labelText)))
		self.attributedText = labelAttributedText
	}
}
