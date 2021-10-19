//
//  NoteCell.swift
//  avmorozova_6PW4
//
//  Created by Anastasia on 19.10.2021.
//

import UIKit

class NoteCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func collectionView(_ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
    "NoteCell", for: indexPath) as! NoteCell
     
        cell.titleLabel.text = "Title"
        cell.descriptionLabel.text = "Description"

        return cell
    }
}

