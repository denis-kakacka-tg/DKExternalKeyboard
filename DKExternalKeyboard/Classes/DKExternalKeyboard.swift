//
//  DKExternalKeyboard.swift
//  DKExternalKeyboard
//
//  Created by Denis Kakačka on 14/03/2019.
//

import UIKit

@objc public protocol DKExternalKeyboardDelegate: class {
    func didTapSearch(query: String?)
}

@objcMembers public class DKExternalKeyboard: UIView {
    @IBOutlet private weak var shiftButton: DKKeyboardActionButton!
    @IBOutlet private weak var hideButton: DKKeyboardActionButton!
    @IBOutlet private weak var searchButton: DKKeyboardActionButton!
    @IBOutlet private weak var deleteButton: DKKeyboardActionButton!
    
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
            return assertionFailure("Textfield not configured call `show(for:on:)` method with correct textField parameter.")
        }
        
        textField.text = actualText + character
    }

    @IBAction private func deleteTapped(_ sender: UIButton) {
        guard let textField = textField, let actualText = textField.text else { return }
        
        if !actualText.isEmpty { textField.text?.removeLast() }
    }
    
    @IBAction private func doneTapped(_ sender: UIButton) {
        guard let delegate = delegate else {
            return assertionFailure("Delegate not configured call `setDelegate(_:)` method.")
        }
        
        delegate.didTapSearch(query: textField?.text)
    }
    
    @IBAction private func spaceTapped(_ sender: UIButton) {
        guard let textField = textField, let actualText = textField.text else { return }
        
        textField.text = actualText + " "
    }
    
    @IBAction private func shiftTapped(_ sender: UIButton) {
        isCapitalized = !isCapitalized
        sender.isSelected = isCapitalized
        
        getAllSubviews()
            .compactMap { $0 as? DKKeyboardCharacterButton }
            .forEach {
                let keyCharacter = isCapitalized ? $0.titleLabel?.text?.capitalized : $0.titleLabel?.text?.lowercased()
                $0.setTitle(keyCharacter, for: .normal)
        }
    }
    
    @IBAction private func hideTapped(_ sender: UIButton) {
        hide(from: self)
        textField?.resignFirstResponder()
    }
}

// MARK: - Internal
extension DKExternalKeyboard {
    func setupActionButtons() {
        shiftButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        deleteButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        hideButton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        shiftButton.imageView?.contentMode = .scaleAspectFit
        hideButton.imageView?.contentMode = .scaleAspectFit
        deleteButton.imageView?.contentMode = .scaleAspectFit
        searchButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        if let imageView = deleteButton.imageView {
            imageView.transform = imageView.transform.rotated(by: CGFloat(-Double.pi / 2))
        }
    }
}

// MARK: - Public
extension DKExternalKeyboard {
    public func show(for textField: UITextField, on view: UIView) {
        self.textField = textField
        view.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: 216).isActive = true
    }
    
    public func hide(from view: UIView) {
        view.removeFromSuperview()
    }
    
    public func setDelegate(_ delegate: DKExternalKeyboardDelegate) {
        self.delegate = delegate
    }
}
