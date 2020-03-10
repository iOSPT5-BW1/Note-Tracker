//
//  ThemeSelectionViewController.swift
//  Notare
//
//  Created by conner on 3/5/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    var darkMode = Bool()
    var lightMode = Bool()
    @IBOutlet weak var donebutton: UIBarButtonItem!
    @IBOutlet weak var darkThemeSwitch: UISwitch!
    @IBOutlet weak var lightThemeSwitch: UISwitch!
    @IBOutlet weak var DarkLabel: UILabel!
    @IBOutlet weak var lightLabel: UILabel!
    @IBOutlet weak var fontLabel: UILabel!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var topBar: UINavigationItem!
    
    var colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemIndigo,
        .systemPurple,
        .white,
        .black
    ]
    
    var identifiers: [String] = [
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "indigo",
        "purple",
        "white",
        "black"
    ]
    
    @IBAction func colorTapped(_ sender: UIButton) {
        if sender.accessibilityLabel == "font" {
            for index in 0...identifiers.count {
                if sender.accessibilityIdentifier == identifiers[index] {
                    Theme.current.fontColor = colors[index]
                    return;
                }
            }
        }
        if sender.accessibilityLabel == "button" {
            for index in 0...identifiers.count {
                if sender.accessibilityIdentifier == identifiers[index] {
                    Theme.current.buttonColor = colors[index]
                    return;
                }
            }
        }
        if sender.accessibilityLabel == "background" {
            for index in 0...identifiers.count {
                if sender.accessibilityIdentifier == identifiers[index] {
                    Theme.current.backgroundColor = colors[index]
                    return;
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let darkDefault = UserDefaults.standard
        let lightDefault = UserDefaults.standard
        darkMode = darkDefault.bool(forKey: "darkDefault")
        lightMode = lightDefault.bool(forKey: "lightDefault")
        if darkMode {
            darkThemeSwitch.isOn = true
            lightThemeSwitch.isOn = false
            Theme.current = DarkTheme()
            setTheme()
        } else {
            lightThemeSwitch.isOn = true
            darkThemeSwitch.isOn = false
            Theme.current = LightTheme()
            setTheme()
        }
    }
    
    @IBAction func darkSwitched(_ sender: Any) {
        darkThemeSwitch.isOn = true
        lightThemeSwitch.isOn = false
        let darkDefault = UserDefaults.standard
        darkDefault.set(true, forKey: "darkDefault")
        let lightDefault = UserDefaults.standard
        lightDefault.set(false, forKey: "lightDefault")
        Theme.current = DarkTheme()
        navigationController?.navigationBar.barStyle = .black
        setTheme()
    }
    
    @IBAction func lightSwitched(_ sender: Any) {
        lightThemeSwitch.isOn = true
        darkThemeSwitch.isOn = false
        let darkDefault = UserDefaults.standard
        darkDefault.set(false, forKey: "darkDefault")
        let lightDefault = UserDefaults.standard
        lightDefault.set(true, forKey: "lightDefault")
        Theme.current = LightTheme()
        navigationController?.navigationBar.barStyle = .default
        setTheme()
    }
    @IBAction func doneTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        self.view.backgroundColor = Theme.current.backgroundColor
        DarkLabel.textColor = Theme.current.fontColor
        lightLabel.textColor = Theme.current.fontColor
        fontLabel.textColor = Theme.current.fontColor
        buttonLabel.textColor = Theme.current.fontColor
        backgroundLabel.textColor = Theme.current.fontColor
        topBar.titleView?.tintColor = Theme.current.fontColor
        donebutton.tintColor = Theme.current.buttonColor
    }
}
