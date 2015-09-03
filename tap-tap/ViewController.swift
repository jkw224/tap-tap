//
//  ViewController.swift
//  tap-tap
//
//  Created by Jonathan Wood on 9/2/15.
//  Copyright © 2015 Jonathan Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Properties
    var tapCounter: Int = 0
    var totalTaps: Int = 0
    
    
    //Outlets
    @IBOutlet weak var tapTapLogo: UIImageView!
    @IBOutlet weak var numTapsToWin: UITextField!
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var tapBtn: UIButton!
    
    @IBOutlet weak var youWin: UILabel!
    
    
    //Actions
    @IBAction func onPlayBtnPressed (sender: UIButton!) {
        
        tapTapLogo.hidden = true
        numTapsToWin.hidden = true
        startBtn.hidden = true
        
        tapsLabel.hidden = false
        tapBtn.hidden = false
        
        youWin.hidden = true
        
        totalTapsInitializer()
        tapCounter = 0
        
        updateTapsLabel()
    }
    
    @IBAction func onTapBtnPressed(sender: UIButton!) {
        tapCounter++
        updateTapsLabel()
        
        if displayYouWin() {
            youWin.hidden = false
            tapsLabel.hidden = true
        } else if postWinClick() {
            restartGame()
        }
    }
    
    
    // Functions
    func totalTapsInitializer() {
        if let tapsText = numTapsToWin.text {
            totalTaps = Int(tapsText)!
        }
    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(tapCounter) Taps"
    }
    
    func displayYouWin() -> Bool {
        if tapCounter == totalTaps {
            return true
        } else {
            return false
        }
    }
    
    func postWinClick() -> Bool {
        if tapCounter >= totalTaps + 1 {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        tapTapLogo.hidden = false
        numTapsToWin.hidden = false
        startBtn.hidden = false
        
        tapsLabel.hidden = true
        tapBtn.hidden = true
        
        youWin.hidden = true
    }
    
}

