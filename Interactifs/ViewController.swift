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
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLbl: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textField.delegate = self
        // Gesture (1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,action:#selector(hideKeyboard)))
        updateSwitchLabel()
        updateStepperLabel()
        }
    
    // (1)
    @objc func hideKeyboard() {
       view.endEditing(true)
    }
    
    /**Fonction pour mon switch*/
    func updateSwitchLabel() {
        switchLabel.text = "Valeur du Switch" + " : " + String(MySwitch.isOn)
    }
    
    func updateStepperLabel() {
        let number = Int(stepper.value)
        stepperLbl.text = "Valeur du stepper: \(number)"
    }
    
    
    /**=======ACTIONS=======*/
    @IBAction func switchChanger(_ sender: UISwitch) {
         updateSwitchLabel()
    }
    @IBAction func stapperChanger(_ sender: UIStepper) {
        updateStepperLabel()
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

