//
//  LoginPresenter.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol LoginPresenterProtocol: class {
    var viewModel: LoginViewModel { get }
    func attach()
}

class LoginPresenter: LoginPresenterProtocol {
   var viewModel = LoginViewModel()
   weak private var viewController: LoginViewControllerProtocol?
   private let disposeBag = DisposeBag()
    
   //MARK: - Init
    init(viewController: LoginViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func attach() {
        handleLoginButtonTap()
    }
    
    private func handleLoginButtonTap() {
        viewModel.loginTap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let email = self.viewModel.emailMobile.value ?? ""
            let password = self.viewModel.password.value ?? ""
            let parameters: [String: String] = ["username": email,"password": password]
            let headers: [String: String] = ["Accept": "application/json"]
            Alamofire.request("http://expertsfloor.com/ferrari2/index.php?id=2", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).response { (myResponse) in
                do{
                    let myReasult = try JSONDecoder().decode(LoginModel.LoginResponse.self, from: myResponse.data!)
                    if let token = myReasult.token {
                        let data = Data(token.utf8)
                        KeyChain.save(key: "Token", data: data)
                        self.viewController?.showAlert(title: "Done", msg: "login Sucessfully")
                    } else {
                        self.viewController?.showAlert(title: "Error", msg: "username or password wrong")
                    }

                } catch let error {
                    print("error is :\(error)")
                    self.viewController?.showAlert(title: "Error", msg: "Something wont wrong")
                }
               
            }
            

        }).disposed(by: self.disposeBag)
    }
    
}
