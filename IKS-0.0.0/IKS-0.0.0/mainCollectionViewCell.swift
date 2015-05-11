//
//  mainCollectionViewCell.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class mainCollectionViewCell: UICollectionViewCell {
	let textLabel: UILabel!
	let imageView: UIImageView!
	
	override init(frame: CGRect) {
		imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*2/3))
		imageView.contentMode = UIViewContentMode.ScaleAspectFit
		
		let textFrame = CGRect(x: 0, y: imageView.frame.size.height, width: frame.size.width, height: frame.size.height/3)
		textLabel = UILabel(frame: textFrame)
		textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
		textLabel.textAlignment = .Center
		
		super.init(frame: frame)
		
		contentView.addSubview(textLabel)
		contentView.addSubview(imageView)
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
