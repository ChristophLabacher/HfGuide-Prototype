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
	let hasDetail : Bool
	
	var visible : Bool = false
	var active : Bool = false
	
	init(id : Int)	{
		self.id = id;
		
		self.hasDetail = true
		self.type = CardType.Projekt
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