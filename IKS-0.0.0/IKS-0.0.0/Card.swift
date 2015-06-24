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

	// Check meine hippe Enumeration
	let type : CardType
	// Muss bei Fragen (vorläufig) false sein
	let hasDetail : Bool
	
	// Große Karte ist da
	var visible : Bool = false
	// Details können angeschaut werden
	var active : Bool = false
	// Details wurden gelesen
	var read : Bool = false

	// Bis jetzt erstmal nur imagniäre Pfade zu imaginären Webviews
	let detailSlide1 : String?
	let detailSlide2 : String?
	
	init(id : Int)	{
		self.id = id;
		
		self.hasDetail = true
		self.type = CardType.Projekt
		
		// Wandelt den Wert der Enumartion in einen String um den wir für das label benutzen können.
		var typeString = self.type.rawValue
	}
	
}

enum CardType : String	{
	case Projekt = "Projekt"
	case Frage = "Frage"
	case Ausstattung = "Ausstattung"
	case Bewerbung = "Bewerbung"
	case Persönliches = "Persönliches"
}