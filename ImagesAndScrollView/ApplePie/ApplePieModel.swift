//
//  ApplePieModel.swift
//  ImagesAndScrollView
//
//  Created by Harut on 11/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import Foundation



class Word {
    static var wordsBank: [String] = ["arctic", "ararat", "armenia", "cat", "elephant", "mountain", "everest", "pixel", "snake", "instance", "insurance"]
    private(set) var bank = Word.wordsBank
    
    func giveNewWordFromBank() -> [String] {
        var result: [String] = []
        let randomIndex = Int.random(in: 0..<bank.count)
        bank.remove(at: randomIndex).forEach { result.append(String($0)) }
        return result
    }
    
    init() {
        bank.shuffle()
    }
}


class Game {
    private(set) var wins: Int = 0
    private(set) var losses: Int = 0
    private(set) var points: Int = 0
    private(set) var incorrectMoves: Int = 0
    private var words: Word = Word()
    private(set) var wordToGuess: [String]
    private(set) var guessedLetters: [String]
    
    
    init() {
        wordToGuess = words.giveNewWordFromBank()
        guessedLetters = [String](repeating: "_", count: wordToGuess.count)
    }
    
    
    func checkAndUpdateGuessed(letter: String) {
        if wordToGuess.contains(letter) {
            for (index, char) in wordToGuess.enumerated() {
                if letter == "\(char)" {
                    guessedLetters[index] = letter
                    points += 50
                }
            }
        } else {
            incorrectMoves += 1
            points -= 20
        }
    }
    
    
    func updateScore() -> Bool {
        if wordToGuess == guessedLetters {
            wins += 1
            newRound()
            return true
        }
        
        if incorrectMoves == 5 {
            losses += 1
            newRound()
            return true
        }
        return false
    }
    
    
    private func newRound() {
        if words.bank.isEmpty {
            wins = 0
            losses = 0
            points = 0
            words = Word()
        }
        
        incorrectMoves = 0
        wordToGuess = words.giveNewWordFromBank()
        guessedLetters = [String](repeating: "_", count: wordToGuess.count)
    }
    
}

