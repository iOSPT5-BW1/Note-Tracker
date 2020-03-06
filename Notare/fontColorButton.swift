//
//  fontColorButton.swift
//  Notare
//
//  Created by conner on 3/5/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class fontColorButton: UIButton {
    @IBAction func red(_ sender: Any) {
        Theme.current.fontColor = UIColor.systemRed
        print(Theme.current.fontColor)
    }
    @IBAction func orange(_ sender: Any) {
        Theme.current.fontColor = UIColor.systemOrange
    }
    @IBAction func yellow(_ sender: Any) {
        Theme.current.fontColor = UIColor.systemYellow
    }
    @IBAction func green(_ sender: Any) {
        Theme.current.fontColor = UIColor.systemGreen
    }
    @IBAction func blue(_ sender: Any) {
        Theme.current.fontColor = UIColor.systemBlue
    }
    @IBAction func indigo(_ sender: Any) {
        Theme.current.fontColor = UIColor.systemIndigo
    }
    @IBAction func purple(_ sender: Any) {
        Theme.current.fontColor = UIColor.systemPurple
    }
    @IBAction func white(_ sender: Any) {
        Theme.current.fontColor = UIColor.white
    }
    @IBAction func black(_ sender: Any) {
        Theme.current.fontColor = UIColor.black
    }
    @IBAction func more(_ sender: Any) {
    }
}
