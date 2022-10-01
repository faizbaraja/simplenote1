//
//  AddNotesViewController.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

class AddNotesViewController: UIViewController {
    let viewModel:AddNotesViewModel// = AddNotesViewModel()
    @IBOutlet var textFieldTitle: UITextField!
    @IBOutlet var textFieldCategory: UITextField!
    @IBOutlet var buttonCategorySelector: UIButton!
    @IBOutlet var textFieldDesc: UITextField!
    
    lazy var notesCategoryVC = CategoryListViewController()
    init(selectedNoteData: NoteStructure? = nil, shouldSelectNote:Bool = false) {
        viewModel = AddNotesViewModel(selectedNoteData: selectedNoteData, shouldSelectNote: shouldSelectNote)
        super.init(nibName: "AddNotesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Notes"
        
        if let selectedNote = viewModel.selectedNote, viewModel.shouldSelectNote {
            showSelectedNote(selectedNote: selectedNote)
        }
    }
    
    @IBAction func saveNote(sender: UIButton) {
        viewModel.saveNote(noteTitle: textFieldTitle.text, noteCategory: buttonCategorySelector.currentTitle, noteDescription: textFieldDesc.text){ () -> () in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func openNotesCategory(sender: UIButton) {
        self.navigationController?.pushViewController(notesCategoryVC, animated: true)
        notesCategoryVC.delegate = self
    }
    
    func setNotesData(noteData: NoteStructure) {
        self.textFieldTitle.text = noteData.noteTitle
        self.buttonCategorySelector.setTitle(noteData.noteCategory, for: .normal)
        self.textFieldDesc.text = noteData.noteDescription
    }
    
    func showSelectedNote(selectedNote: NoteStructure) {
        textFieldDesc.text = selectedNote.noteDescription
        textFieldTitle.text = selectedNote.noteTitle
        buttonCategorySelector.setTitle(selectedNote.noteCategory, for: .normal)
    }
}

extension AddNotesViewController: CategoryListViewControllerProtocol {
    func setCategoryText(categoryText: String) {
        buttonCategorySelector.setTitle(categoryText, for: .normal)
    }
}
