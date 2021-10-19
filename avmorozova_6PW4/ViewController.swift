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
        // Do any additional setup after loading the view.
    }


}

