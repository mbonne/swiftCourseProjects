//
//  ViewController.swift
//  How Many Fingers
//
//  Created by MB on 28/10/18.
//  Copyright © 2018 [code]SIMPLE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var guessedNumberField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBAction func guessButtonTapped(_ sender: Any) {
        
        let hand = String(arc4random_uniform(6))
        
        if guessedNumberField.text == hand {
            resultLabel.text = "You're Right!"
        } else {
            resultLabel.text = "Wrong! It was " + hand + "."
        }
        print("Computer has " + hand + " Fingers")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

