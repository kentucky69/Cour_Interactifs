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
    @IBOutlet weak var MySwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textField.delegate = self
        // Gesture (1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        updateSwitchLabel()
        }
    
    // (1)
    @objc func hideKeyboard() {
       view.endEditing(true)
    }
    
    func updateSwitchLabel() {
        switchLabel.text = "Valeur du Switch" + " : " + String(MySwitch.isOn)
    }
    
    @IBAction func switchChanger(_ sender: UISwitch) {
         updateSwitchLabel()
    }
    
}
// Les differentes extensions delegate
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

