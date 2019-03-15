//
//  ViewController.swift
//  DKExternalKeyboard
//
//  Created by deniskakacka on 03/14/2019.
//  Copyright (c) 2019 deniskakacka. All rights reserved.
//

import UIKit
import DKExternalKeyboard

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    private lazy var keyboard: DKExternalKeyboard = {
        let keyboard: DKExternalKeyboard = DKExternalKeyboard.loadFromNib()
        keyboard.setDelegate(self)
    
        return keyboard
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
}

extension ViewController: DKExternalKeyboardDelegate {
    func didTapDone(query: String?) {
        guard let query = query else { return }
        print(query)
        
        keyboard.removeFromSuperview()
        textField.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboard.show(for: textField, on: self)
    }
}
