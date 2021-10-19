//
//  ViewController.swift
//  avmorozova_6PW4
//
//  Created by Anastasia on 19.10.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var notesCollectionView: UICollectionView!
    
    @IBOutlet weak var emptyCollectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(createNote(sender:)))
    }
    
    let context: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "CoreDataNotes")
    container.loadPersistentStores { _, error in if let error = error {
        fatalError("Container loading failed")}}
     return container.viewContext
     }()

    @objc func createNote(sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(
                withIdentifier: "NoteViewController") as? NoteViewController else { return }
        
         vc.outputVC = self
         navigationController?.pushViewController(vc, animated: true)
    }
    
    var notes: [Note] = [] {
        didSet {
            emptyCollectionLabel.isHidden = notes.count != 0
            notesCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }

    func collectionView(_ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "NoteCell", for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        
        cell.titleLabel.text = note.title
        cell.descriptionLabel.text = note.descriptionText

        return cell
    }
    
    func saveChanges() {
        if context.hasChanges {
            try? context.save()
        }
        
        if let notes: [Note] = try? context.fetch(Note.fetchRequest()) {
            self.notes = notes
        } else {
            self.notes = []
        }
     }

     func loadData() {
        if let notes: [Note] = try? context.fetch(Note.fetchRequest())
        {
            self.notes = notes.sorted(
                by: { $0.creationDate.compare(($1 as AnyObject).creationDate) == .orderedDescending})
        } else {
            self.notes = []
        }
     }
}

