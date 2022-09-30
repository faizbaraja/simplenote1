//
//  AddNotesViewController.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

class AddNotesViewController: UIViewController {
    let viewModel = AddNotesViewModel()
    @IBOutlet var textFieldTitle: UITextField!
    @IBOutlet var textFieldCategory: UITextField!
    @IBOutlet var textFieldDesc: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Notes"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNote(sender: UIButton) {
        viewModel.saveNote(noteTitle: textFieldTitle.text, noteCategory: textFieldCategory.text, noteDescription: textFieldDesc.text)
    }

}
