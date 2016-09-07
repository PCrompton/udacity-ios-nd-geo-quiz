//
//  QuizViewController.swift
//  GeoQuiz
//
//  Created by Jarrod Parkes on 6/21/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: - QuizViewController: UIViewController

class QuizViewController: UIViewController {
  
    // MARK: Outlets
    
    @IBOutlet weak var flagButton1: UIButton!
    @IBOutlet weak var flagButton2: UIButton!
    @IBOutlet weak var flagButton3: UIButton!
    @IBOutlet weak var repeatPhraseButton: UIButton!
  
    @IBOutlet weak var correctCount: UILabel!
    @IBOutlet weak var incorrectCount: UILabel!
    // MARK: Properties
    
    var languageChoices = [Country]()
    var lastRandomLanguageID = -1
    var selectedRow = -1
    var correctButtonTag = -1
    var currentState: QuizState = .NoQuestionUpYet
    var spokenText = ""
    var bcpCode = ""
    let speechSynth = AVSpeechSynthesizer()
    var score: [String: Int] = ["correct": 0, "incorrect": 0]
    // MARK: Actions
    
    // This function is called when user presses a flag button.
    @IBAction func flagButtonPressed(sender: UIButton) {

        // TODO: Add code to display a message to the user telling them whether or not they guessed correctly.
        
        if sender.tag == correctButtonTag {
            displayAlert("Correct", messageText: "Great Job!")
            self.score["correct"]! += 1
        } else {
            displayAlert("Incorrect", messageText: "Try again.")
            self.score["incorrect"]! += 1
        }
        updateScore()
    }
    
    func updateScore() {
        self.correctCount.text = String(self.score["correct"]!)
        self.incorrectCount.text = String(self.score["incorrect"]!)
    }
    
}