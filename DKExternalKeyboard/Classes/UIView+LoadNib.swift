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

//public extension UIView {
//    class func instance(from bundle: Bundle? = nil, nibName: String? = nil,
//                         owner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> Self? {
//        
//        let bundleForClass = Bundle(for: self)
//        
//        guard let bundleUrl = bundleForClass.url(forResource: className, withExtension: "bundle"),
//            let bundle = Bundle(url: bundleUrl)
//            else {
//                assertionFailure("BUNDLE NOT FOUND")
//                return nil
//        }
//        
//        return instancePrivate(from: bundle, //?? Bundle.main,
//                               nibName: nibName ?? className,
//                               owner: owner,
//                               options: options)
//    }
//    
//    private static func instancePrivate<T: UIView>(from bundle: Bundle, nibName: String,
//                                                   owner: Any?, options: [UINib.OptionsKey : Any]?) -> T? {
//        
//        guard
//            let views = bundle.loadNibNamed(nibName, owner: owner, options: options),
//            let view = views.first(where: { $0 is T }) as? T else { return nil }
//        
//        return view
//    }
//}
