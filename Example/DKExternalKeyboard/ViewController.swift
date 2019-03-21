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
    
    private lazy var keyboardContainer: DKExternalKeyboardView = {
        let keyboardContainer = DKExternalKeyboardView()
        keyboardContainer.keyboard.setDelegate(self)
                        
        return keyboardContainer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
}

extension ViewController: DKExternalKeyboardDelegate {
    func didTapSearch(query: String?) {
        guard let query = query else { return }
        print(query)
        
        keyboardContainer.keyboard.removeFromSuperview()
        textField.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardContainer.keyboard.show(for: textField, on: view)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let vieww = UIView(frame: .zero)
        textField.inputView = vieww
        
        return true
    }
}
