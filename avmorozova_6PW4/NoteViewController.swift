//
//  NoteViewController.swift
//  avmorozova_6PW4
//
//  Created by Anastasia on 19.10.2021.
//

import UIKit

class NoteViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var outputVC: ViewController!

     override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .done,
                target: self,
                action: #selector(didTapSaveNote(button:)))
     }

     @objc func didTapSaveNote(button: UIBarButtonItem) {
        let title = titleTextField.text ?? ""
        let description = textView.text ?? ""
        
        if !title.isEmpty {
            let newNote = Note(title: title, description: description)
            outputVC.notes.append(newNote)
        }
        
        self.navigationController?.popViewController(animated: true)
     }
}
