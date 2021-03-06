//
//  NotesViewController.swift
//  NoteTaking
//
//  Created by Allan Caine on 2017-03-11.
//  Copyright © 2017 Allan Caine. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController{
    
    @IBOutlet var notesTextView: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var editButton: UIButton!
    
    var notesData: NotesData!
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.delegate = self
    }
    
    
    @IBAction func addNote(_ sender: UIButton) {
        guard let newNote = notesTextView.text else{
            return
        }
        guard !newNote.isEmpty else {
            return
        }
        notesData.add(newNote)
        tableView.reloadData()
        notesTextView.text = ""
    }
    
    @IBAction func editTable(_ sender: UIButton) {
        guard notesData.notes.count > 0 else{
            return
        }
        tableView.setEditing(!tableView.isEditing, animated: true)
        let buttonText = tableView.isEditing ? "Done" : "Edit"
        sender.setTitle(buttonText, for: .normal)
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        notesTextView.resignFirstResponder()
    }
}

extension NotesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesData.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let note = notesData.notes[indexPath.row]
        
        cell.textLabel?.text = note
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            notesData.notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if(notesData.notes.count == 0){
                editButton.setTitle("Edit", for: .normal)
            }
        }
    }
}

//extension NotesViewController: UITableViewDelegate{
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        notesTextView.resignFirstResponder()
//    }
//    
//}
