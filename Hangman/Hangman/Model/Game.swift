//
//  File.swift
//  Hangman
//
//  Created by Prince Wang and Zhi Bian on 2019/10/18.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class Game {
    
    var guessCount: Int!
    var underscoreWord: String!
    var currentWord: String! //this is the displayed word
    var actualWord: String!
    var incorrect: [String]
    var wrongGuessNum: Int!
    var winResult: Bool!
    var file: File!
    
    
    init() {
        file = File()
        actualWord = file.actualWord
        underscoreWord = file.underscoreWord
        currentWord = underscoreWord
        wrongGuessNum = 0
        incorrect = []
        winResult = false
        guessCount = 0
    }
    
    
    func play(guess: Character) -> Bool{
        let status: Bool = evaluateGuess(letter: guess)
        if (status) {
            print(guess)
            permuteCurrentWord(char: guess)
            winResult = winCheck()
        } else {
            wrongGuessNum += 1
            let incGuess = guess.uppercased()
            incorrect.append(incGuess)
            
        }
        return status
    }
    
    
    //Function that check whether the player won
    //Note: This function only checks if there are any "_" left
    //Return: Boolean, if the player won it is true, else false
   func winCheck() -> Bool {
        let ourWord = currentWord!
        for char in ourWord {
            if char == "_" {
                return false
            } else {
                continue
            }
        }
        return true
    }
    
    
    func failCheck() -> Bool {
        let ourWord = currentWord!
        for char in ourWord {
            if char == "_" {
                return false
            } else {
                continue
            }
        }
        return true
    }

    
    
    
    //Check if player's guess is correct, returns a boolean
    func evaluateGuess(letter: Character) -> Bool {
        if actualWord.contains(letter) {
            return true
        } else {
            return false
        }
    }
    
    
    //This function is called when the player guessed the correct letter
    //It permutes CURRENTWORD so that the newly guessed letter get displayed
    func permuteCurrentWord (char: Character) {
        if actualWord.contains(char) == false {
            print("Error")
        } else {
            let allAppearances: [Int] = allIndicesInString(letter: char, word: actualWord)
            var newString = ""
            for num in Range(0...currentWord!.count-1){
                if (num % 2 == 1) {
                    newString += " "
                } else {
                    if (allAppearances.contains((num/2))) {
                        newString += String(Array(actualWord)[num/2])
                    } else {
                        newString += String(Array(currentWord)[num])
                    }
                }
            }
            currentWord = newString
        }
    }
    
    //Find all indices where a char appears in a string
    func allIndicesInString(letter: Character, word: String) -> [Int] {
        var intArr: [Int] =  []
        var index = 0
        for char in word {
            if (char == letter) {
                intArr.append(index)
            }
            index += 1
        }
        return intArr
    }
    
    
    
}
