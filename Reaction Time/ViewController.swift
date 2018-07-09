//
//  ViewController.swift
//  Reaction Time
//
//  Created by Jason Dong on 7/6/18.
//  Copyright © 2018 Jason Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var collectionOfButtons: [UIButton]!
    @IBOutlet weak var timerDisplay: UILabel!
    var counter = 0.0
    var timer = Timer()

    func restartGame () {
        counter = 0.0
        for button in collectionOfButtons {
            button.isHidden = false
        }
        
    }
    func gameIsDone () -> Bool{
        for button in collectionOfButtons {
            if !button.isHidden {
                return false
            }
        }
        return true

    }
    @IBAction func ifButtonTapped(_ sender: UIButton) {
        sender.isHidden = true
        if gameIsDone () {
            
                    timer.invalidate()
                let endOfGameAlert = UIAlertController(title: "Your time was \(counter)", message:nil, preferredStyle: .alert)
                let endOfGameAction = UIAlertAction(title: "OK", style: .default) {
                    (action) in
                    self.restartGame ()
                }
            endOfGameAlert.addAction(endOfGameAction)
            present(endOfGameAlert, animated: true, completion: nil)
        }
    }
    
    @objc
    func UpdateTimer() {
        counter = counter + 0.1
        timerDisplay.text = String(format: "%.1f", counter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        

}

}
