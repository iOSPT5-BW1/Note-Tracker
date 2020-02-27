//
//  notesController.swift
//  CreativeNotes
//
//  Created by conner on 2/26/20.
//  Copyright © 2020 conner. All rights reserved.
//

import Foundation

class notesController {
    var notes: [note] =
        [note(title: "Todo List", content: "Buy milk"),
         note(title: "Shopping List", content: "Grapes, Strawberries, Protein Powder")]

     var trashed: [note] {
        return notes.filter({$0.inTrash})
     }
     
     var pinned: [note] {
        return notes.filter({$0.isPinned})
     }
    
    func addNote(title: String, content: String?) {
        notes.append(note(title: title, content: content))
        // Save to storage
    }

    
}
