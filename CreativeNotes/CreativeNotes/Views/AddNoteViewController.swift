//
//  AddNoteViewController.swift
//  CreativeNotes
//
//  Created by conner on 2/26/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    // Will need to change to textfield
    @IBOutlet weak var content: UITextView!
    var delegate: AddNoteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        // will need to use delegate and pop vc after
        navigationController?.popViewController(animated: true)
        delegate?.addNote(title: "Example Title", content: content.text)
    }

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
