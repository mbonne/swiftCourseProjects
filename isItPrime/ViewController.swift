//
//  ViewController.swift
//  Is It Prime
//
//  Created by MB on 5/11/18.
//  Copyright © 2018 [code]SIMPLE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var posNumField: UITextField!
    
    @IBAction func isItPrimeBtn(_ sender: Any) {
        print("Calculating Prime Now...")
        if posNumField.text != nil {
            let userEnteredInteger = Int(posNumField.text!)
            if let number = userEnteredInteger {
                var isPrime = true
                
                if number == 1 {
                    isPrime = false
                }
                
                var i = 2
                
                while i < number {
                    
                    if number % i == 0 {
                        isPrime = false
                    }
                    i += 1
                }
                
                print(isPrime)
                if isPrime {
                    answerLabel.text = "\(number) is prime!"
                } else {
                    answerLabel.text = "\(number) is not prime."
                }
                
                
            } else {
                answerLabel.text = "Enter number characters only"
                print("User entered incorrect characters")
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

