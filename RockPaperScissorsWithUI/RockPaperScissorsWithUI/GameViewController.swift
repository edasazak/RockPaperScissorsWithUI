//
//  ViewController.swift
//  RockPaperScissorsWithUI
//
//  Created by Mac on 8.07.2023.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var rock: UIImageView!
    @IBOutlet weak var paper: UIImageView!
    @IBOutlet weak var scissors: UIImageView!
    @IBOutlet weak var myScoreLabel: UILabel!
    @IBOutlet weak var botScoreLabel: UILabel!
    
    lazy var elements = [rock, paper, scissors]
    lazy var botPlayer = elements.randomElement()!
    var myScore = 0
    var botScore = 0
    var result: String?
    var myChoice: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GameViewController.imageTapped(gesture:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.image2Tapped(gesture:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.image3Tapped(gesture:)))

        rock.addGestureRecognizer(tapGesture)
        paper.addGestureRecognizer(tapGesture2)
        scissors.addGestureRecognizer(tapGesture3)

        for image in elements {
            image?.isUserInteractionEnabled = true
        }
        
        }
    
    @IBAction func resultsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func clearScores(_ sender: UIButton) {
        myScore = 0
        botScore = 0
        myScoreLabel.text = String(myScore)
        botScoreLabel.text = String(botScore)
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
            if (gesture.view as? UIImageView) != nil {
            
                if (botPlayer==scissors) {
                    result = "You Win!"
                    myScore+=1
                    
                } else if (botPlayer==paper) {
                    result = "Computer Wins :( Maybe next time!"
                    botScore+=1
                }else {
                    result = "That's a Tie!"
                }
                myScoreLabel.text = String(myScore)
                botScoreLabel.text = String(botScore)
            }
        }
    @objc func image2Tapped(gesture: UIGestureRecognizer) {
            if (gesture.view as? UIImageView) != nil {
                if (botPlayer==scissors) {
                    result = "Computer Wins :( Maybe next time!"
                    botScore+=1
                } else if (botPlayer==rock) {
                    result = "You Win!"
                    myScore+=1
                }else {
                    result = "That's a Tie!"
                }
                myScoreLabel.text = String(myScore)
                botScoreLabel.text = String(botScore)
            }
        }
    @objc func image3Tapped(gesture: UIGestureRecognizer) {
            if (gesture.view as? UIImageView) != nil {
                if (botPlayer==rock) {
                    result = "Computer Wins :( Maybe next time!"
                    botScore+=1
                } else if (botPlayer==paper) {
                    result = "You Win!"
                    myScore+=1
                }else {
                    result = "That's a Tie!"
                }
                myScoreLabel.text = String(myScore)
                botScoreLabel.text = String(botScore)
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.myChoiceImage = myChoice
            destinationVC.botChoiceImage = botPlayer?.image
            destinationVC.result = result
        }
    }
}

