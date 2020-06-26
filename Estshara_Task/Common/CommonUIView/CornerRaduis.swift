//
//  CornerRaduis.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit

class CreateCornerRauis {
    
    static func viewRaduis(view:UIView , number: CGFloat)-> UIView{
        view.layer.cornerRadius = number
        return view
    }
    
    static func ButtonRaduis(button:UIButton , number: CGFloat)-> UIButton{
        button.layer.cornerRadius = number
        return button
    }
    
    static func imageViewRaduis(view:UIImageView , number: CGFloat)-> UIImageView {
        view.layer.cornerRadius = number
        return view
    }
}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
