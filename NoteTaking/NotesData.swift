//
//  NotesData.swift
//  NoteTaking
//
//  Created by Allan Caine on 2017-03-11.
//  Copyright © 2017 Allan Caine. All rights reserved.
//

import UIKit

class NotesData: NSObject{
    
    var notes: [String] = []
    
    func add(_ newNote: String){
        notes.append(newNote)
    }
    
    func remove(_ note: String){
        guard let index = notes.index(of: note) else{
            return
        }
        notes.remove(at: index)
    }
    
    
    
}
