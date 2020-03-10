//
//  ViewController.swift
//  Notare
//
//  Created by Bree Young on 3/2/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var addNote: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var paintButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolbar: UIToolbar!
    
    @IBOutlet weak var sortButton: UIBarButtonItem!
    // MARK: Initial Variables
    var data: [String] = []
    var notes: [Note] = []
    var selectedRow = -1
    var newRowText = ""

    // filteredNotes holds results for notes search
    var filteredNotes: [Note] = []
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool { return searchController.searchBar.text?.isEmpty ?? true }
    
    var fileURL: URL!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setFileURL()
        loadNotes()
        setupSearchController()
        setTheme()
    }
    
    // MARK: sortTapped
    @IBAction func sortTapped(_ sender: Any) {
        let sortedNotes = data.sorted(by: {$0 < $1})
        data = sortedNotes
        tableView.reloadData()
    }
    
    // MARK: setFileURL
    func setFileURL() {
        let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        fileURL = baseURL.appendingPathComponent("notes.txt")
    }
    // MARK: loadNotes
    func loadNotes() {
        if let loadedNotes: [String] = NSArray(contentsOf: fileURL) as? [String] {
            data = loadedNotes
            tableView.reloadData()
        }
    }
    // MARK: Search Functionality
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Notes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func filterContentForSearchText(_ searchText: String, category: Note.Category? = nil) {
      filteredNotes = notes.filter { (note: Note) -> Bool in
        return note.name.lowercased().contains(searchText.lowercased())
      }
      tableView.reloadData()
    }}

    extension ViewController: UISearchResultsUpdating {
      func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
        tableView.reloadData()
      }
        
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedRow != -1 {
            data[selectedRow] = newRowText
            if newRowText == "" {
                data.remove(at: selectedRow)
            }
            tableView.reloadData()
            saveNotes()
        }
        setTheme()
    }
    // MARK: saveNotes
    func saveNotes() {
        let arrayDirectory = NSArray(array: data)
        do {
            try arrayDirectory.write(to: fileURL)
        } catch {
            print("Error in saveNotes()")
        }
    }
    
    // MARK: Plus Button
    @IBAction func createNewNoteButton(_ sender: UIBarButtonItem) {
        if tableView.isEditing { return }
        let name: String = ""
        data.insert(name, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "detailNotes", sender: nil)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        // MARK: Cell Themeing
        cell.backgroundColor = Theme.current.backgroundColor
        cell.textLabel?.textColor = Theme.current.fontColor
        return cell
    }
    
    // MARK: Edit button Functions
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    @IBAction func editNote(_ sender: UIBarButtonItem) {
        self.navigationItem.leftBarButtonItem = editButtonItem
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.reloadData()
    }
    
    // Segue on row select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailNotes", sender: nil)
    }
    
    // MARK: prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailNotes" {
            let detailView: DetailViewController = segue.destination as! DetailViewController
            selectedRow = tableView.indexPathForSelectedRow!.row // always making sure you have a selected row before transistion to detail view controller screen
            detailView.masterView = self
            detailView.setText(t: data[selectedRow]) // sending selected cell text/data to the detail view
        } else if segue.identifier == "themeSelection" {
            
        }
    }
        
    
        
    func setTheme() {
        self.view.backgroundColor = Theme.current.backgroundColor
        paintButton.tintColor = Theme.current.buttonColor
        tableView.backgroundColor = Theme.current.backgroundColor
        //editButton.tintColor = Theme.current.buttonColor
        addNote.tintColor = Theme.current.buttonColor
        toolbar.barTintColor = Theme.current.backgroundColor
        toolbar.backgroundColor = Theme.current.backgroundColor
        sortButton.tintColor = Theme.current.buttonColor
        tableView.reloadData()
        
    }
}

