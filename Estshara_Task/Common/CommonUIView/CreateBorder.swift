//
//  CreateBorder.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit

class CreateBorder {
    
    static func viewBorder(view:UIView , width : CGFloat , color : CGColor)-> UIView{
        view.layer.borderWidth = width
        view.layer.borderColor = color
        return view
    }
    
    static func buttonBorder(button:UIButton , width : CGFloat , color : CGColor)-> UIButton{
           button.layer.borderWidth = width
           button.layer.borderColor = color
           return button
    }
}
