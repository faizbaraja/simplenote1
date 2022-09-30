//
//  ViewController.swift
//  SimpleNote
//
//  Created by faiz baraja on 30/09/22.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Notes"
        
        let addBarButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(openAddNotesPage))
        self.navigationItem.rightBarButtonItem  = addBarButton
    }
    
    @objc func openAddNotesPage() {
        let addNotesVC = AddNotesViewController()
        self.navigationController?.pushViewController(addNotesVC, animated: true)
    }

}
