//
//  DKExternalKeyboard.swift
//  DKExternalKeyboard
//
//  Created by Denis Kakačka on 14/03/2019.
//

import UIKit

@objc public protocol DKExternalKeyboardDelegate: class {
    func didTapDone(query: String?)
}

@objcMembers public class DKExternalKeyboard: UIView {
    private weak var delegate: DKExternalKeyboardDelegate?
    private weak var textField: UITextField?
    private var isCapitalized = false
    
    private init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

// MARK: - IBActions
extension DKExternalKeyboard {
    @IBAction private func keyTapped(_ sender: UIButton) {
        guard let character = sender.titleLabel?.text else { return }
        guard let textField = textField, let actualText = textField.text else {
            assertionFailure("TEXTFIELD NOT CONFIGURED")
            return
        }
        
        textField.text = actualText + character
    }
    
    @IBAction private func deleteTapped(_ sender: UIButton) {
        guard let textField = textField, let actualText = textField.text else {
            assertionFailure("TEXTFIELD NOT CONFIGURED")
            return
        }
        
        if !actualText.isEmpty { textField.text?.removeLast() }
    }
    
    @IBAction private func doneTapped(_ sender: UIButton) {
        guard let delegate = delegate else {
            assertionFailure("DELEGATE NOT CONFIGURED")
            return
        }
        
        delegate.didTapDone(query: textField?.text)
    }
    
    @IBAction private func spaceTapped(_ sender: UIButton) {
        guard let textField = textField, let actualText = textField.text else {
            assertionFailure("TEXTFIELD NOT CONFIGURED")
            return
        }
        
        textField.text = actualText + " "
    }
    
    @IBAction private func shiftTapped(_ sender: UIButton) {
        isCapitalized = !isCapitalized
        
        subviews
            .flatMap { $0.subviews }
            .flatMap { $0.subviews }
            .filter { $0.tag == 1 }
            .map { $0 as! UIButton }
            .forEach { 
                let keyCharacter = isCapitalized ? $0.titleLabel?.text?.capitalized : $0.titleLabel?.text?.lowercased()
                $0.setTitle(keyCharacter, for: .normal)
        }
    }
}

// MARK: - Public
extension DKExternalKeyboard {
    public func show(for textField: UITextField, on viewController: UIViewController) {
        self.textField = textField
        viewController.view.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    public func setDelegate(_ delegate: DKExternalKeyboardDelegate) {
        self.delegate = delegate
    }
}
