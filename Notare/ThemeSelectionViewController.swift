//
//  ThemeSelectionViewController.swift
//  Notare
//
//  Created by conner on 3/5/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet var themeView: UIView!
    
    @IBOutlet weak var backgroundColorLabel: UILabel!
    @IBOutlet weak var buttonColorLabel: UILabel!
    @IBOutlet weak var fontColorLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var darkThemeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        initTheme()
    }
    override func viewDidAppear(_ animated: Bool) {
        initTheme()
    }
    
    func initTheme() {
        themeView.backgroundColor = Theme.current.backgroundColor
        backgroundColorLabel.textColor = Theme.current.fontColor
        buttonColorLabel.textColor = Theme.current.fontColor
        fontColorLabel.textColor = Theme.current.fontColor
        sliderLabel.textColor = Theme.current.fontColor
    }
    
    @IBAction func darkThemeTapped(_ sender: Any) {
        if darkThemeSwitch.isOn {
            Theme.current = DarkTheme()
        } else {
            Theme.current = LightTheme()
        }
        self.view.setNeedsDisplay();
    }
    
    @IBAction func doneTapped(_ sender: Any) {
navigationController?.popViewController(animated: true)
    viewWillDisappear(true)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
