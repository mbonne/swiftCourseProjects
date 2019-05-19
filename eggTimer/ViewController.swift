//
//  ViewController.swift
//  eggTimer
//
//  Created by MB on 15/12/18.
//  Copyright © 2018 [code]SIMPLE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var time = 300
    
    @objc func decreaseTimer() {
        
        if time > 0 {
            time -= 1
            timerLabel.text = String(time)
        } else {
            print("Timer reached Zero. Will stop the clock")
            timer.invalidate()
        }
        
    }
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBAction func playPressed(_ sender: Any) {
        print("Starting Timer...")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        print("Pausing Timer...")
        timer.invalidate()
    }
    
    @IBAction func plusTen(_ sender: Any) {
        print("Adding 10 seconds to time")
        if time < 291 {
            time += 10
            timerLabel.text = String(time)
        } else {
            print("Timer will not exceed 5min")
            print("Reset time to 5 Minutes")
            time = 300
            timerLabel.text = String(time)
        }
    }
    
    @IBAction func minusTen(_ sender: Any) {
        print("Taking 10 seconds away from time")
        if time > 10 {
            time -= 10
            timerLabel.text = String(time)
        } else {
            print("Time below 10 Seconds. Unable to take 10 seconds away")
        }
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        print("Reset time to 5 Minutes")
        time = 300
        timerLabel.text = String(time)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
}
