//
//  LoginViewController.swift
//  Estshara_Task
//
//  Created by Mohamed Gamal on 6/24/20.
//  Copyright © 2020 Me. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


protocol LoginViewControllerProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }
    func showAlert(title: String, msg: String)
}

class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailContainerIcon: UIView!
    @IBOutlet weak var passwordContainerIcon: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Properties
    var presenter: LoginPresenterProtocol?
    let disposeBag = DisposeBag()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        presenter?.attach()
        bindLoginButton()
        bindTextFields()
    }
    
    //MARK: - binding
    private func bindTextFields() {
        emailTextField.rx.text.changed.bind { [weak self] (text) in
            guard let viewModel = self?.presenter?.viewModel else { return }
            viewModel.emailMobile.accept(text)
        }.disposed(by: disposeBag)
        
        passwordTextField.rx.text.changed.bind { [weak self] (text) in
            guard let viewModel = self?.presenter?.viewModel else { return }
            viewModel.password.accept(text)
        }.disposed(by: disposeBag)
    }
    
    private func bindLoginButton() {
        guard let viewModel = presenter?.viewModel else { return }
        loginBtn.rx.tap
            .bind(to: viewModel.loginTap)
            .disposed(by: disposeBag)
    }
    
}

 //MARK: - Extnsions
extension LoginViewController {
    func initView() {
        emailContainerView = CreateCornerRauis.viewRaduis(view: emailContainerView, number: 5)
        passwordContainerView = CreateCornerRauis.viewRaduis(view: passwordContainerView, number: 5)
        emailContainerIcon = CreateCornerRauis.viewRaduis(view: emailContainerIcon, number: 5)
        passwordContainerIcon = CreateCornerRauis.viewRaduis(view: passwordContainerIcon, number: 5)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    func showAlert(title: String, msg: String) {
         ShowAlertView.showAlert(title: title, msg: msg, sender: self)
    }
}
