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
    
    
    var text: String = ""
    
    var masterView: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTextView.text = text
        self.navigationItem.largeTitleDisplayMode = .never

        // Theme inclusion
        detailTextView.backgroundColor = Theme.current.backgroundColor
        detailTextView.textColor = Theme.current.fontColor
        cancelButton.tintColor = Theme.current.buttonColor
        saveButton.tintColor = Theme.current.buttonColor
        detailView.backgroundColor = Theme.current.backgroundColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailTextView.becomeFirstResponder() // function to bring up software keyboard by automatically selecting text view
    }
    
    func setText(t: String) {
        text = t
        
        // verifying to see if the view is loaded before we perform any modifications
        
        if isViewLoaded {
            // modify text view after view has loaded
            detailTextView.text = t
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = detailTextView.text
        detailTextView.resignFirstResponder()
        
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        viewWillDisappear(true)
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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
