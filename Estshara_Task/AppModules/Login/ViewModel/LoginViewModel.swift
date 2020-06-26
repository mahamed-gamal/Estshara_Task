//
//  LoginViewModel.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/25/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct LoginViewModel {
    let emailMobile = BehaviorRelay<String?>(value: "")
    let password = BehaviorRelay<String?>(value: "")
    let loginTap = PublishSubject<Void>()
}



