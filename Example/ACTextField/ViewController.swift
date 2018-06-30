//
//  ViewController.swift
//  ACTextField
//
//  Created by varkrishna on 06/30/2018.
//  Copyright (c) 2018 varkrishna. All rights reserved.
//

import UIKit
import ACTextField

class ViewController: UIViewController,ACTextFieldDelegate {

    @IBOutlet weak var firstTextField: ACTextField!
    @IBOutlet weak var secondTextField: ACTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.setAutoCompleteWith(DataSet: ["Apple","Mango","Orange"])
        firstTextField.ACDelegate = self
        secondTextField.setAutoCompleteWith(DataSet: ["Beer","Wine","Food","Drink"])
        secondTextField.suggestionTextColor = UIColor.yellow
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ACTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

}

