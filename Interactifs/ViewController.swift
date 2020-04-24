//
//  ViewController.swift
//  Interactifs
//
//  Created by Ken Gassy on 24/04/2020.
//  Copyright © 2020 Ken Gassy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textPassWord: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textField.delegate = self
        textPassWord.delegate = self
        // Gesture (1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        }
    // (1)
    @objc func hideKeyboard() {
       view.endEditing(true)
    }
    
}
// avec le bouton return et delegate
extension ViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(String(describing: textField.text) )
        return true
    }
}

