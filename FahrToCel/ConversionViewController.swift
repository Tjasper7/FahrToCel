//
//  ConversionViewController.swift
//  FahrToCel
//
//  Created by Tyler Jasper on 8/1/16.
//  Copyright © 2016 Tyler Jasper. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelciusLabel()
        }
    }
    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var fahrenheitTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
        } else {
            fahrenheitValue = nil
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    func updateCelciusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dimsissKeyboard(sender: AnyObject) {
        fahrenheitTextField.resignFirstResponder()
    }
    
}
