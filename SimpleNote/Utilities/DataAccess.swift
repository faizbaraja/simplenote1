//
//  DataAccess.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

class DataAccess: NSObject {
    static func getNote() -> [NoteStructure] {
        let userDefaults = UserDefaults.standard
        do {
            let myNotes = try userDefaults.getObject(forKey: "MyNotesList", castTo: [NoteStructure].self)
            print(myNotes)
            return myNotes
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
