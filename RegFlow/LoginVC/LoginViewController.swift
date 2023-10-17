

import UIKit

class LoginViewController: UIViewController {
    
    
    private let topLabel = UILabel()
    private let mainView = UIView()
    private let loginButton = UIButton()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let mainStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setConfiguration()
        setConstraints()
    }
    
    private func setConfiguration() {
        view.backgroundColor = .black
        view.addSubview(mainStackView)
        view.addSubview(topLabel)
        
        topLabel.theTopLabel(text: "Welcome back to the matrix!")
        
       
        loginButton.skeletonButton(title: "Login")
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.addSubview(emailTextField)
        mainStackView.addSubview(passwordTextField)
        mainStackView.addSubview(loginButton)
      
       
        
        mainStackView.backgroundColor = .darkGray
        mainStackView.layer.cornerRadius = 20
        //
        emailTextField.layer.cornerRadius = 20
        emailTextField.backgroundColor = .gray
        emailTextField.attributedPlaceholder = NSAttributedString(string: "    Enter email", attributes: [.foregroundColor: UIColor.darkText])
       
        //
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.backgroundColor = .gray
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "    Password", attributes: [.foregroundColor: UIColor.darkText])
    }
    
}

extension LoginViewController {
    func setConstraints() {

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            //
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            mainStackView.heightAnchor.constraint(equalToConstant: 300),
            //
            emailTextField.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            //
            passwordTextField.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            //
            loginButton.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}



