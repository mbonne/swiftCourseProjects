//
//  ViewController.swift
//  catYears
//
//  Created by MB on 2/10/18.
//  Copyright © 2018 [code]SIMPLE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var humanAgeField: UITextField!
    @IBOutlet var catAgeLabel: UILabel!
    @IBAction func calculateButtonTapped(_ sender: Any) {
//
//        let humanYears = humanAgeField.text
//        let catYears = (humanYears! as NSString).integerValue
//
//        catAgeLabel.text = String(catYears*7)

        let ageInCatYears = Int(humanAgeField.text!)! * 7
        catAgeLabel.text = String(ageInCatYears)
// the !)! part of the code, if left unhandled when letters are typed
// Will cause a Fatal Error.
        
        print(catAgeLabel.text!, "Meows")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

