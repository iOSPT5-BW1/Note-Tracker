//
//  DetailViewController.swift
//  Notare
//
//  Created by Bree Jeune on 3/2/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailView: UIView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func shareTapped(_ sender: UIBarButtonItem) {
        let activityVC = UIActivityViewController(activityItems: [detailTextView.text ?? ""], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    var text: String = ""
    
    var masterView: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTextView.text = text
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailTextView.becomeFirstResponder() // function to bring up software keyboard by automatically selecting text view
        setTheme()
    }
    
    func setText(t: String) {
        text = t
        if isViewLoaded { detailTextView.text = t }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        detailTextView.resignFirstResponder()
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        masterView.newRowText = detailTextView.text
        viewWillDisappear(true)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    func setTheme() {
        detailTextView.backgroundColor = Theme.current.backgroundColor
        detailTextView.textColor = Theme.current.fontColor
        cancelButton.tintColor = Theme.current.buttonColor
        saveButton.tintColor = Theme.current.buttonColor
        detailView.backgroundColor = Theme.current.backgroundColor
    }
}
