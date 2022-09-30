//
//  AddNotesViewModel.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

class AddNotesViewModel: NSObject {
    
    func saveNote(noteTitle: String?, noteCategory: String?, noteDescription: String?) {
        let noteObject = NoteStructure (noteTitle: noteTitle,
                                        noteCategory: noteCategory,
                                        noteDescription: noteDescription)
        
        
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(noteObject, forKey: "MyNotesList")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getNote() -> NoteStructure? {
        let userDefaults = UserDefaults.standard
        do {
            let myNotes = try userDefaults.getObject(forKey: "MyNotesList", castTo: NoteStructure.self)
            print(myNotes)
            return myNotes
        } catch {
            print(error.localizedDescription)
            return nil
        }        
    }

}
