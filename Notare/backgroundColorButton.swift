//
//  backgroundColorButton.swift
//  Notare
//
//  Created by conner on 3/5/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class backgroundColorButton: UIButton {

    @IBAction func red(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.systemRed
        print(Theme.current.backgroundColor)
    }
    @IBAction func orange(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.systemOrange
    }
    @IBAction func yellow(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.systemYellow
    }
    @IBAction func green(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.systemGreen
    }
    @IBAction func blue(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.systemBlue
    }
    @IBAction func indigo(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.systemIndigo
    }
    @IBAction func purple(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.systemPurple
    }
    @IBAction func white(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.white
    }
    @IBAction func black(_ sender: Any) {
        Theme.current.backgroundColor = UIColor.black
    }
    @IBAction func more(_ sender: Any) {
    }
}
