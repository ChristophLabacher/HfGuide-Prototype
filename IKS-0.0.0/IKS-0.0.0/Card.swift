//
//  Card.swift
//  IKS-0.0.0
//
//  Created by Christoph Labacher on 12.06.15.
//  Copyright (c) 2015 Made with ♥ in Schwäbisch Gmünd. All rights reserved.
//

import Foundation

class Card	{
	
	let id : Int;

	let type : String
	let minorIds : [Int]

	let title : String
	let subtitle : String
	let coverImage : String
	let detailSlide : String
	
    // visible if a beacon is close, but not gone away again
	var visible : Bool = false
    // active when a beacon was close and gone away
	var active : Bool = false
	// selected when a card is centered
	var selected : Bool = false
	// reading when card is enlarged
	var reading : Bool = false
	// read when card was enlarged once
    var read : Bool = false
	
	var noteCount : Int = 0
	
	let data : NSDictionary

	
	init(card : NSDictionary)	{
		self.data = card
		self.id = card["id"] as! Int
		self.title = card["title"] as! String
		self.subtitle = card["subtitle"] as! String
		self.coverImage = card["coverImage"] as! String
		self.detailSlide = card["detailSlide"] as! String
		self.minorIds = card["minorIds"] as! [Int]
		self.type = card["type"] as! String;
	}
	
}