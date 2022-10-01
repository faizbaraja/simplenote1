//
//  NotesCollectionViewCell.swift
//  SimpleNote
//
//  Created by faiz baraja on 01/10/22.
//

import UIKit

class NotesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var labelNoteTitle: UILabel!
    @IBOutlet var labelNoteCategory: UILabel!
    @IBOutlet var labelNoteDescription: UILabel!
    @IBOutlet var viewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelNoteTitle.textColor = .white
        labelNoteCategory.textColor = .white
        labelNoteDescription.textColor = .white
        
        labelNoteTitle.font = UIFont(name: "Helvetica", size: 14.0)
        labelNoteCategory.font = UIFont(name: "Helvetica", size: 10.0)
        labelNoteDescription.font = UIFont(name: "Helvetica", size: 14.0)
        
        viewContainer.backgroundColor = .lightGray
        viewContainer.layer.cornerRadius = 5
    }
    
    func configCell(cellData: NoteStructure) {
        labelNoteTitle.text = cellData.noteTitle
        labelNoteCategory.text = cellData.noteCategory
        labelNoteDescription.text = cellData.noteDescription
    }

}
