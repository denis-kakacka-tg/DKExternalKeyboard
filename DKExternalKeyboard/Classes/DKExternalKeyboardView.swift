//
//  DKExternalKeyboardView.swift
//  DKExternalKeyboard
//
//  Created by Denis Kakačka on 18/03/2019.
//

import UIKit

@objcMembers public class DKExternalKeyboardView: UIView {
    public let keyboard: DKExternalKeyboard
    
    public init() {
        keyboard = DKExternalKeyboard.loadFromNib()
        super.init(frame: .zero)
        
        keyboard.frame = frame
        addSubview(keyboard)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
