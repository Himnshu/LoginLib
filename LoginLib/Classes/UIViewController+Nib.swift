//
//  UIViewController+Nib.swift
//  Pods
//
//  Created by Himanshu Mahajan on 23/07/17.
//
//

import Foundation

public extension UIViewController {

    func viewFromNib() -> UIView {
        let name = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        guard let view = bundle.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else {
            fatalError("Nib not found.")
        }
        return view
    }
    
}
