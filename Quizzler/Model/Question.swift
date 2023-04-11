//
//  Question.swift
//  Quizzler
//
//  Created by VASILY IKONNIKOV on 09.04.2023.
//

import Foundation

struct Question {
	let text: String
	let answer: String
	
	init(q: String, a: String) {
		self.text = q
		self.answer = a
	}
}
