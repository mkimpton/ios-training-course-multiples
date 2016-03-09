//
//  ViewController.swift
//  Multiples
//
//  Created by Mike Kimpton on 3/9/16.
//  Copyright © 2016 Fuji America. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var multipleText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let maxValue: Int = 200
    var lastTotal: Int = 0
    var currentTotal: Int = 0
    var multipleValue: Int = 0
    
    @IBAction func onAddButtonPressed(sender: UIButton!) {
        if isTotalUptoMaxValue() {
            resetValues()
            toggleControls()
        } else {
            lastTotal = currentTotal
            currentTotal = lastTotal + multipleValue
            
            updateResultLabel()
        }
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        if multipleText.text != nil && multipleText.text != "" {
            toggleControls()
            multipleValue = Int(multipleText.text!)!
        }
    }
    
    func resetValues() {
        resultLabel.text = "Press Add to add!"
        multipleText.text = nil
                
        lastTotal = 0
        currentTotal = 0
        multipleValue = 0
    }
    
    func updateResultLabel() {
        resultLabel.text = "\(lastTotal) + \(multipleValue) = \(currentTotal)"
    }
    
    func isTotalUptoMaxValue() -> Bool {
        if currentTotal >= maxValue {
            return true
        }
        return false
    }

    func toggleControls() {
        logoImage.hidden = !logoImage.hidden
        playButton.hidden = !playButton.hidden
        multipleText.hidden = !multipleText.hidden
        
        resultLabel.hidden = !resultLabel.hidden
        addButton.hidden = !addButton.hidden
    }
}

