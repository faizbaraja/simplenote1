//
//  ViewController.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableListNotes: UITableView!
    @IBOutlet var collectionListNotes: UICollectionView!
    
    var notesCollection = DataAccess.getNote()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Notes"
        registerCell()
        
        let addBarButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(openAddNotesPage))
        self.navigationItem.rightBarButtonItem  = addBarButton
        tableListNotes.reloadData()
        collectionListNotes.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        notesCollection = DataAccess.getNote()
        tableListNotes.reloadData()
        collectionListNotes.reloadData()
        super.viewDidAppear(animated)
    }
    
    private func registerCell() {
        tableListNotes.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
        collectionListNotes.register(UINib(nibName: "NotesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NotesCollectionViewCell")
    }
    
    @objc func openAddNotesPage() {
        let addNotesVC = AddNotesViewController()
        self.navigationController?.pushViewController(addNotesVC, animated: true)
    }
    

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let currentNote = notesCollection[indexPath.row]
        cell.textLabel?.text = currentNote.noteTitle

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NotesCollectionViewCell", for: indexPath) as! NotesCollectionViewCell
        let currentNote = notesCollection[indexPath.row]
        cell.configCell(cellData: currentNote)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notesCollection.count
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedNote = notesCollection[indexPath.item]
        let addNotesVC = AddNotesViewController(selectedNoteData: selectedNote, shouldSelectNote: true)
        self.navigationController?.pushViewController(addNotesVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 20) / 2 - 5
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
