//
//  CustomView.swift
//  IOSBasic
//
//  Created by minhdtn on 07/09/2022.
//

import UIKit

@IBDesignable
class CustomView: UIView {
    private var _cornerRadius: CGFloat = 0.0
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            layer.cornerRadius = _cornerRadius
        } get {
            return _cornerRadius
        }
    }
}
