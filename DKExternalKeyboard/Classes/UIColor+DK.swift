//
//  UIColor+DK.swift
//  DKExternalKeyboard
//
//  Created by Denis Kakačka on 21/03/2019.
//

import Foundation

extension UIColor {
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1.0) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

extension UIColor {
    static let dkBlack = UIColor(27, 27, 27)
    static let dkGray = UIColor(65, 65, 65)
    static let dkLightGray = UIColor(98, 98, 98)
}
