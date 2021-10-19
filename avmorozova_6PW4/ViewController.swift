//
//  ViewController.swift
//  avmorozova_6PW4
//
//  Created by Anastasia on 19.10.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
     return 1
     }

     func collectionView(_ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell =
    collectionView.dequeueReusableCell(withReuseIdentifier:
    "NoteCell", for: indexPath)

     return cell
     }
    

    @IBOutlet weak var notesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var emptyCollectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNote(sender:)))
    }


    @objc func createNote(sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(
            withIdentifier: "NoteViewController") else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

