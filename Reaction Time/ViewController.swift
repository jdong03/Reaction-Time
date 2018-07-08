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
    var counter = 0
    
    
    
    @IBAction func ifButtonTapped(_ sender: UIButton) {
        sender.isHidden = true
        timerDisplay.text = String(counter)
        if gameIsDone () {
// UI View Stuff goes here
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.counter += 1
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

