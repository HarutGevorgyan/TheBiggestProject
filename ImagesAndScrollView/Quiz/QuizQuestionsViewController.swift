//
//  QuizQuestionsViewController.swift
//  ImagesAndScrollView
//
//  Created by Harut on 13/06/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

class QuizQuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        for i in 0..<singleButtons.count {
            if sender == singleButtons[i] {
                answersChosen.append(currentAnswers[i])
                break
            }
        }
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for i in 0..<multiSwitches.count {
            if multiSwitches[i].isOn {
                answersChosen.append(currentAnswers[i])
            }
        }
        nextQuestion()
    }
    
    
    @IBAction func rangeAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    
    
    var questionIndex = 0
    var questions: [Question] = QUESTIONS
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question N\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        
        for i in 0..<singleButtons.count {
            singleButtons[i].setTitle(answers[i].text, for: .normal)
        }
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for i in 0..<multiSwitches.count {
            multiSwitches[i].isOn = false
            multiLabels[i].text = answers[i].text
        }
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let resultViewController = segue.destination as! QuizResultsViewController
            resultViewController.responses = answersChosen
        }
    }
    
}
