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

	let type : CardType
	let minorIds : [Int]

	let title : String
	let subtitle : String
	let detailSlides : [String]
	
    // visible if a beacon is close, but not gone away again
	var visible : Bool = false

    // active when a beacon was close and gone away
	var active : Bool = false

    var read : Bool = false
	
	var noteCount : Int = 0;

	
	init(card : NSDictionary)	{
		self.id = card["id"] as! Int
		self.title = card["title"] as! String
		self.subtitle = card["subtitle"] as! String
		self.detailSlides = card["detailSlides"] as! [String]
		self.minorIds = card["minorIds"] as! [Int]
		self.type = CardType.Projekt;
		
		// Wandelt den Wert der Enumartion in einen String um den wir für das label benutzen können.
		//var typeString = self.type.rawValue
	}
	
}

enum CardType : String	{
	case Projekt = "Projekt"
	case Frage = "Frage"
	case Ausstattung = "Ausstattung"
	case Bewerbung = "Bewerbung"
	case Persönliches = "Persönliches"
}