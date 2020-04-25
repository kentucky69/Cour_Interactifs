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
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var segmentedLbl: UILabel!
    @IBOutlet weak var minSlide: UILabel!
    @IBOutlet weak var maxSlide: UILabel!
    @IBOutlet weak var slideLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerArray = ["Boom Festival","Defqon.1","Syndicate Festival", "Reperkusound,Hypnotik", "Tomorrowland", "Airbeat One Festival"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        textField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        // Gesture (1)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,action:#selector(hideKeyboard)))
        updateSwitchLabel()
        updateStepperLabel()
        segmented.selectedSegmentIndex = 1
        segmented.selectedSegmentTintColor = .systemPink
        updateSegmentedLabel()
        
        slider.maximumTrackTintColor = .systemGray
        minSlide.text = "min \(slider.minimumValue)"
        maxSlide.text = "max \(slider.maximumValue)"
        updateSliderChanged()
        
        
        }
    
    // (1)
    @objc func hideKeyboard() {
       view.endEditing(true)
    }
    
    /** FONCTIONS */
    func updateSwitchLabel() {
        switchLabel.text = "Valeur du Switch" + " : " + String(MySwitch.isOn)
    }
    
    func updateStepperLabel() {
        let number = Int(stepper.value)
        stepperLbl.text = "Valeur du stepper: \(number)"
    }
    
    func updateSegmentedLabel(){
        let index = segmented.selectedSegmentIndex
        if index == 1 {
            segmentedLbl.text = "Géocalisation"
        }else if index <= 1 {
            segmentedLbl.text = "Restaurant"
        } else if index >= 1 {
            segmentedLbl.text = "Coup de coeur"
        }
    }
    
    func updateSliderChanged() {
        let value = Int(slider.value)
        slideLbl.text = "Valeur : \(value)"
        
    }
    
    /**=======ACTIONS=======*/
    @IBAction func switchChanger(_ sender: UISwitch) {
         updateSwitchLabel()
    }
    @IBAction func stapperChanger(_ sender: UIStepper) {
        updateStepperLabel()
    }
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        updateSegmentedLabel()
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateSliderChanged()
    }
    
}
// Les differentes extensions delegate
extension ViewController:UITextFieldDelegate {
    
    /** Fonction pour le clavier*/
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(String(describing: textField.text) )
        return true
    }
}


// UIPickerView
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Element choisi \(pickerArray[row ]) ")
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return pickerArray[row]
    }
    
    
    
    
}

