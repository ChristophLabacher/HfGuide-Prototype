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
	
	var visible : Bool = false
	var active : Bool = false
	var read : Bool = false
	
	var noteCount : Int = 0;

	
	init(id : Int, type : String, title : String, subtitle : String, detailSlides : [String], minorIds : [Int])	{
		self.id = id;
		self.title = title;
		self.subtitle = subtitle;
		self.detailSlides = detailSlides;
		self.minorIds = minorIds;
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