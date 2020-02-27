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
        saveToPersisentStore()
    }

    // Persistance
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documents.appendingPathComponent("notes.plist")
    }
    
    func saveToPersisentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(notes)
            try data.write(to: url)
        } catch {
            print("Error saving notes to storage")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            self.notes = try decoder.decode([note].self, from: data)
        } catch {
            print("Error loading notes from storage")
        }
    }
}
