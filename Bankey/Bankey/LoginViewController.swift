//
//  ViewController.swift
//  Bankey
//
//  Created by Flavio Dobler on 2022-07-20.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let logoLabel = UILabel()
    let subLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username : String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}

extension LoginViewController {
    
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.text = "Bankey"
        logoLabel.font = .boldSystemFont(ofSize: 28)
        logoLabel.textColor = .systemGray
        logoLabel.textAlignment = .center
        logoLabel.numberOfLines = 0
        
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = "Your premium source for all \n things banking!"
        subLabel.numberOfLines = 0
        subLabel.textColor = .systemGray
        subLabel.textAlignment = .center
        subLabel.font = .systemFont(ofSize: 24, weight: .regular)
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(SignInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        
    }
    
    private func layout(){
        view.addSubview(loginView)
        view.addSubview(logoLabel)
        view.addSubview(subLabel)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Logo Label
            
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 26),
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            //logoLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 20),
            //view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        
        ])
        
        //Sub Label
        NSLayoutConstraint.activate([
        
            subLabel.topAnchor.constraint(equalToSystemSpacingBelow: logoLabel.bottomAnchor, multiplier: 1),
            subLabel.centerXAnchor.constraint(equalTo: logoLabel.centerXAnchor)
        
        ])
        
        //Login View
        NSLayoutConstraint.activate([
            
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        //signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2).isActive = true
        
        //Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
    }
}


extension LoginViewController {
    @objc func SignInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Usename / password cannot be blank")
            return
        }
        
        if username == "Flavio" && password == "12345"{
            signInButton.configuration?.showsActivityIndicator = true
        } else {
           configureView(withMessage: "Incorrect Username / Password")
        }
    }
    
    private func configureView (withMessage message : String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}
