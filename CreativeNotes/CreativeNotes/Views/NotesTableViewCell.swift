//
//  NotesTableViewCell.swift
//  CreativeNotes
//
//  Created by conner on 2/26/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contentPreview: UITextView!
    
    var note: note? {
        didSet {
            guard let note = note else { return }
            title.text = note.title
            contentPreview.text = note.content
        }
    }
}
