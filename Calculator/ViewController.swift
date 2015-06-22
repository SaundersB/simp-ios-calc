//
//  ViewController.swift
//  Calculator
//
//  Created by Brandon Saunders on 6/22/15.
//  Copyright (c) 2015 Brandon Saunders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!


    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        display.text = display.text! + digit
    }
}

