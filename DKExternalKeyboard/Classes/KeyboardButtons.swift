//
//  KeyboardCharacterButton.swift
//  DKExternalKeyboard
//
//  Created by Denis Kakačka on 21/03/2019.
//

import Foundation

class DKKeyboardCharacterButton: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 4
        clipsToBounds = true
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .dkLightGray : .dkGray
        }
    }
}

class DKKeyboardActionButton: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 4
        clipsToBounds = true
    }
    
    override var isHighlighted: Bool {
        didSet {
            guard !isSelected else { return }
            backgroundColor = isHighlighted ? .dkLightGray : .white
        }
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? .dkLightGray : .white
            tintColor = isSelected ? .white : .dkGray
            setTitleColor(.white, for: .selected)
        }
    }
}
