//
//  UIView+LoadNib.swift
//  DKExternalKeyboard
//
//  Created by Denis Kakačka on 14/03/2019.
//

import UIKit

public extension UIView {
    @objc class var className: String {
        guard let parsedName = NSStringFromClass(self).components(separatedBy: ".").last
            else {
                assertionFailure("CLASS NAME PARSE FAILED");
                return ""
        }

        return parsedName
    }
    
    class func loadFromNib<T: UIView>() -> T {
        let bundleForClass = Bundle(for: self)
                
        guard let bundleUrl = bundleForClass.url(forResource: className, withExtension: "bundle"),
            let bundle = Bundle(url: bundleUrl),
            let view = bundle.loadNibNamed(className, owner: T.self, options: nil)?.first as? T
            else {
                assertionFailure("LOAD FROM NIB FAILED")
                return T()
        }
        
        return view
    }
}

extension UIView {
    func getAllSubviews<T: UIView>() -> [T] {
        return subviews.flatMap { subView -> [T] in
            var result = subView.getAllSubviews() as [T]
            
            if let view = subView as? T {
                result.append(view)
            }
            
            return result
        }
    }
}

