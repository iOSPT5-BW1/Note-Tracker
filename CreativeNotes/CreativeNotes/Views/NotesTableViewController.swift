//
//  NotesTableViewController.swift
//  CreativeNotes
//
//  Created by conner on 2/26/20.
//  Copyright © 2020 conner. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, AddNoteDelegate {
    
    @IBOutlet weak var notesTable: UITableView!
    
    var notes: [note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTable.delegate = self
        self.notesTable.dataSource = self
    }
    
    func addNote(title: String, content: String) {
        notes.append(note(title: title, content: content))
        notesTable.reloadData()
    }
}

extension NotesTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NotesTableViewCell else { return UITableViewCell() }
        cell.note = notes[indexPath.row]
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNoteSegue" {
            if let addNoteViewController = segue.destination as? AddNoteViewController {
                addNoteViewController.delegate = self
            }
        }
    }

    // Delete button
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            notesTable.beginUpdates()
            notesTable.deleteRows(at: [indexPath], with: .automatic)
            notesTable.endUpdates()
        }
    }
    
}
