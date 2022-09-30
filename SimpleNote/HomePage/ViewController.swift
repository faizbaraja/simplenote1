//
//  ViewController.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableListNotes: UITableView!
    
    var notesCollection = DataAccess.getNote()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Notes"
        registerCell()
        
        let addBarButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(openAddNotesPage))
        self.navigationItem.rightBarButtonItem  = addBarButton
        tableListNotes.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        notesCollection = DataAccess.getNote()
        tableListNotes.reloadData() 
        super.viewDidAppear(animated)
    }
    
    private func registerCell() {
        tableListNotes.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
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
