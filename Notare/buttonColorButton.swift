//
//  buttonColorButton.swift
//  Notare
//
//  Created by conner on 3/5/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class buttonColorButton: UIButton {

    @IBAction func red(_ sender: Any) {
        Theme.current.buttonColor = UIColor.systemRed
        print(Theme.current.buttonColor)
    }
    @IBAction func orange(_ sender: Any) {
        Theme.current.buttonColor = UIColor.systemOrange
    }
    @IBAction func yellow(_ sender: Any) {
        Theme.current.buttonColor = UIColor.systemYellow
    }
    @IBAction func green(_ sender: Any) {
        Theme.current.buttonColor = UIColor.systemGreen
    }
    @IBAction func blue(_ sender: Any) {
        Theme.current.buttonColor = UIColor.systemBlue
    }
    @IBAction func indigo(_ sender: Any) {
        Theme.current.buttonColor = UIColor.systemIndigo
    }
    @IBAction func purple(_ sender: Any) {
        Theme.current.buttonColor = UIColor.systemPurple
    }
    @IBAction func white(_ sender: Any) {
        Theme.current.buttonColor = UIColor.white
    }
    @IBAction func black(_ sender: Any) {
        Theme.current.buttonColor = UIColor.black
    }
    @IBAction func more(_ sender: Any) {
    }
}
