//
//  ViewController.swift
//  Whats The Weather
//
//  Created by MB on 3/1/19.
//  Copyright © 2019 [code]SIMPLE. All rights reserved.
//
// Background image source - https://unsplash.com/search/photos/weather
// Website used for data request - https://www.weather-forecast.com
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var cityTextField: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    var buttonHasBeenPressed = false
    
    @IBAction func getWeather(_ sender: Any) {
        performAction()
    }
    
    // Below is where we hide the keyboard when user pressess outside the keyboard area.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    // End of dealing with keyboard first part - continued below in viewDidLoad - Source: https://stackoverflow.com/questions/41537721/how-to-hide-keyboard-when-return-key-is-hit-swift/41537966
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // And Here dealing with keyboard.
        cityTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ cityTextField: UITextField) -> Bool {
        cityTextField.resignFirstResponder()
        performAction()
        return true
    }
    // End of making keyboard hide when user presses return button - Source: https://stackoverflow.com/questions/41537721/how-to-hide-keyboard-when-return-key-is-hit-swift/41537966
    
    // Below is where the button action is defined so it can be called from both pressing return on the keyboard or pressing the UI button - getWeather
    // Source: https://stackoverflow.com/questions/26288124/how-do-i-get-the-return-key-to-perform-the-same-action-as-a-button-press-in-swif

    func performAction() {
        buttonHasBeenPressed = !buttonHasBeenPressed
        
        if buttonHasBeenPressed == true {
            if let url = URL(string: "https://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
                
                let request = NSMutableURLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request as URLRequest) {
                    data, response, error in
                    
                    var message = ""
                    
                    if error != nil {
                        print(error as Any)
                    } else {
                        if let unwrappedData = data {
                            let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                            
                            var stringSeparator = "(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                            
                            if let contentArray = dataString?.components(separatedBy: stringSeparator) {
                                if contentArray.count > 1 {
                                    stringSeparator = "</span>"
                                    
                                    let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                                    
                                    if newContentArray.count > 1 {
                                        message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                        print(url)
                                        print(message)
                                    }
                                }
                            }
                        }
                    }
                    
                    if message == "" {
                        message = "The Weather for your area couldn't be found. Please try another City."
                        
                    }
                    
                    DispatchQueue.main.sync(execute: {
                        self.resultLabel.text = message
                    })
                    
                }
                
                task.resume()
            } else {
                resultLabel.text = "The Weather for your area couldn't be found. Please try another City."
            }
            
        } // End of buttonHasBeen Pressed
    } // End of performAction Function
}

