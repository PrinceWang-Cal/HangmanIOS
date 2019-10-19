//
//  File.swift
//  Hangman
//
//  Created by Zhi Bian on 10/16/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation
import UIKit

class phraseFile 1 {
    var phrases : NSDictionary!
    var actualWord: String!
    var underscoreWord: String!
        
    init() {
        // Replace "phrases" with your plist's filename
        let path = Bundle.main.path(forResource: "Phrases", ofType: "plist")
        phrases = NSDictionary.init(contentsOfFile: path!)
        let allKeys = phrases.allKeys as! [String]
        let num = allKeys.count
        
        actualWord = allKeys[Int.random(in: 0...num-1)]
        underscoreWord = phrases[actualWord] as! String

    }
    
    }
