//
//  LoginContract.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/25/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import UIKit

class LoginContract {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = LoginViewController()
        let presenter = LoginPresenter(viewController: controller)
        
        controller.presenter = presenter
        return controller
    }
}





