//
//  ApplePieViewController.swift
//  ImagesAndScrollView
//
//  Created by Harut on 11/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit
import AVFoundation

class ApplePieViewController: UIViewController {

    var game = Game()
    
    let apples: [UIImageView] = makeAppleImageViews()
    @IBOutlet weak var tree: UIImageView!
    @IBOutlet weak var guessingWordLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var letters: [UIButton]!
    
    
    @IBAction func letterPressed(_ sender: UIButton) {
        sender.isEnabled = false
        game.checkAndUpdateGuessed(letter: sender.currentTitle!.lowercased())
        guessingWordLabel.text = game.guessedLetters.joined(separator: " ")
        
        if game.incorrectMoves > 0 {
            apples[game.incorrectMoves - 1].isHidden = true
        }
        
        if game.updateScore() {
            resultLabel.text = "Points: \(game.points)  Wins: \(game.wins)  Losses: \(game.losses)"
            Timer.scheduledTimer(timeInterval: TimeInterval(1.5), target: self, selector: Selector(("updateGuessingWordLabel")), userInfo: nil, repeats: false)
            Timer.scheduledTimer(timeInterval: TimeInterval(1.5), target: self, selector: Selector(("enableLetters")), userInfo: nil, repeats: false)
            Timer.scheduledTimer(timeInterval: TimeInterval(1.5), target: self, selector: Selector(("unhideApples")), userInfo: nil, repeats: false)
        }
    }
    
    @objc func enableLetters() { letters.forEach {$0.isEnabled = true} }
    @objc func unhideApples() { apples.forEach { $0.isHidden = false } }
    
    @objc func updateGuessingWordLabel() {
        guessingWordLabel.text = game.guessedLetters.joined(separator: " ")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGuessingWordLabel()
        resultLabel.text = "Points: \(game.points)  Wins: \(game.wins)  Losses: \(game.losses)"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        apples.forEach{ view.addSubview($0) }
        setFrames(for: apples, dependingOn: tree)
    }
}
