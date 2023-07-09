//
//  ResultViewController.swift
//  RockPaperScissorsWithUI
//
//  Created by Mac on 8.07.2023.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var myChoice: UIImageView!
    @IBOutlet weak var botChoice: UIImageView!
    @IBOutlet weak var whoWins: UILabel!
    var botChoiceImage: UIImage?
    var myChoiceImage: UIImage?
    var result: String?
    
    override func viewDidLoad() {
        botChoice.image = botChoiceImage
        myChoice.image = myChoiceImage
        whoWins.text = result
    }
}
