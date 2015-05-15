//
//  ScrollCollectionViewCell.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 11.05.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import UIKit

class ScrollCollectionViewCell: UICollectionViewCell {
	let imageView: UIImageView!
	
	override init(frame: CGRect) {
		imageView = UIImageView()
		imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
		imageView.contentMode = UIViewContentMode.ScaleAspectFill
		imageView.clipsToBounds = true
		imageView.backgroundColor = UIColor.redColor()
		
		super.init(frame: frame)
		
		contentView.addSubview(imageView)
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
