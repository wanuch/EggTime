//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var statusLabel: UILabel!
    let eggTimes : [String:Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        if let result = eggTimes[hardness] {
            self.titleLabel.text = "Cooking.. " + hardness
            self.statusLabel.text = "0%"
            self.progressBar.progress = 0.0
            secondPassed = 0
            let totalTime = result
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.secondPassed < totalTime {
                    self.secondPassed += 1
                    let percentageProgress = Float(self.secondPassed)/Float(totalTime)
                    let percent = percentageProgress*100
                    let status = String(format: "%.2f", percent)
                    self.statusLabel.text = status as String+"%"
                    self.progressBar.progress = percentageProgress
                } else {
                    Timer.invalidate()
                    self.titleLabel.text = "Done!!!"
                }
            }
            
        }
        
    }
}
