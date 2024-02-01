//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // multiplies by 60 for time conversion to seconds
    let eggTimes = ["Soft": 5*60, "Medium": 7*60, "Hard": 12*60]
    var timer = Timer()
    var timeOfCompletion = 60
    var secondsElapsed = 0

    @IBOutlet weak var progressViewBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        reset()
        
        let hardness = sender.currentTitle!
        
        timeOfCompletion = eggTimes[hardness]!
        
        // creating a timer that executes a function on every interval
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
    @objc func updateTime(){
        secondsElapsed += 1
        let currentProgress: Float = Float(secondsElapsed)/Float(timeOfCompletion)
        if(currentProgress < 1.0){
            progressViewBar.setProgress(currentProgress, animated: true)
        } else if (currentProgress == 1.0) {
            progressViewBar.setProgress(currentProgress, animated: true)
            titleLabel.text = "Done!!"
        } else {
            // creating delay for better UI
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.reset()
            }
        }
    }
    
    func reset(){
        // resetting all necessary values
        timer.invalidate()
        progressViewBar.setProgress(0.0, animated: true)
        secondsElapsed = 0
        titleLabel.text = "How do you like your eggs?"
    }

}
