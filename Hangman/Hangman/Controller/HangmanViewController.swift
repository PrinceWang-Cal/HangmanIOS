//
//  HangmanViewController
//  Hangman
//
//  Created by Prince Wang and Zhi Bian on 2/19/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    @IBOutlet weak var wordToGuess: UILabel!
    @IBOutlet weak var incorrectGuesses: UILabel!
    
    @IBOutlet weak var chanceLeft: UILabel!
    @IBOutlet weak var hangMan: UIImageView!
    var gameInstance = Game()
    var guessedChar: Character? = nil
    
    @IBOutlet var keys: [UIButton]!
    
    @IBAction func buttonPressed(_ sender : UIButton) {
        for key in keys {
            key.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        guessedChar = Array((sender.titleLabel?.text ?? nil)!)[0]
        
        sender.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
    }
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        if guessedChar != nil {
            let status = gameInstance.play(guess: guessedChar!)
            wordToGuess.text = gameInstance.currentWord
            if status != true {
                incorrectGuesses.text! += gameInstance.incorrect[gameInstance.wrongGuessNum-1] + " "
                chanceLeft.text = "Chances Left: \(7-gameInstance.wrongGuessNum)"
                hangMan.image = UIImage(named: "mhangman\(1+gameInstance.wrongGuessNum)")
            }
            if (gameInstance.winResult == true) {
                let alert = UIAlertController(title: "CONGRATS", message: "You won the game! Would you like to start again?", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Ya", style: .default, handler: {
                    action in self.reset()
                }))

                self.present(alert, animated: true)
            }
            if (gameInstance.wrongGuessNum == 7) {
                let alert = UIAlertController(title: "YOU ARE DEAD", message: "RIP", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Let me die", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Start again", style: .default, handler: {
                    action in self.reset()
                }))

                self.present(alert, animated: true)
            }
        }
       }
    
    func reset() {
        gameInstance = Game()
        for key in keys {
            key.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        hangMan.image = #imageLiteral(resourceName: "mhangman1")
        wordToGuess.text = gameInstance.underscoreWord
        incorrectGuesses.text = "Incorrect Guesses: "
        chanceLeft.text = "Chances Left: 7"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(patternImage: UIImage(named:"background")!)
        for key in keys {
            key.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        wordToGuess.text = gameInstance.underscoreWord
        hangMan.image = #imageLiteral(resourceName: "mhangman1")
        incorrectGuesses.text = "Incorrect Guesses: "
        chanceLeft.text = "Chances Left: 7"
    }

}

