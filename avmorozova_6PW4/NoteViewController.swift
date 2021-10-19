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
        self.navigationController?.popViewController(animated: true)
     }
}
