//
//  EnterNameViewController.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 4.10.23.
//

import UIKit

class EnterNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black

        // Создаем текстовое поле для ввода имени пользователя
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "Name"
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [.foregroundColor: UIColor.gray])
        usernameTextField.textColor = UIColor.green
        usernameTextField.textAlignment = .center
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.layer.borderColor = UIColor.green.cgColor
        usernameTextField.layer.borderWidth = 1.0
        usernameTextField.tintColor = .white
        view.addSubview(usernameTextField)

        // Ограничения для текстового поля
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 250),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}





//class EnterNameViewController: UIViewController {
//    private var backgroundImageView: UIImageView!
//        private var usernameTextField: UITextField!
//        private var emailTextField: UITextField!
//        private var passwordTextField: UITextField!
//        private var nicknameTextField: UITextField!
//        private var registerButton: UIButton!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            // Установка фона
//            backgroundImageView = UIImageView(frame: view.bounds)
//            backgroundImageView.image = UIImage(named: "matrix_background")
//            backgroundImageView.contentMode = .scaleAspectFill
//            view.addSubview(backgroundImageView)
//
//            // Создание текстового поля для ввода имени
//            usernameTextField = UITextField(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
//            usernameTextField.backgroundColor = UIColor(white: 0, alpha: 0.4)
//            usernameTextField.textColor = UIColor.green
//            usernameTextField.placeholder = "Имя"
//            usernameTextField.textAlignment = .center
//            view.addSubview(usernameTextField)
//
//            // Создание текстового поля для ввода электронной почты
//            emailTextField = UITextField(frame: CGRect(x: 50, y: 150, width: 200, height: 40))
//            emailTextField.backgroundColor = UIColor(white: 0, alpha: 0.4)
//            emailTextField.textColor = UIColor.green
//            emailTextField.placeholder = "Электронная почта"
//            emailTextField.textAlignment = .center
//            view.addSubview(emailTextField)
//
//            // Создание текстового поля для ввода пароля
//            passwordTextField = UITextField(frame: CGRect(x: 50, y: 200, width: 200, height: 40))
//            passwordTextField.backgroundColor = UIColor(white: 0, alpha: 0.4)
//            passwordTextField.textColor = UIColor.green
//            passwordTextField.placeholder = "Пароль"
//            passwordTextField.textAlignment = .center
//            view.addSubview(passwordTextField)
//
//            // Создание текстового поля для ввода никнейма
//            nicknameTextField = UITextField(frame: CGRect(x: 50, y: 250, width: 200, height: 40))
//            nicknameTextField.backgroundColor = UIColor(white: 0, alpha: 0.4)
//            nicknameTextField.textColor = UIColor.green
//            nicknameTextField.placeholder = "Никнейм"
//            nicknameTextField.textAlignment = .center
//            view.addSubview(nicknameTextField)
//
//            // Создание кнопки регистрации
//            registerButton = UIButton(frame: CGRect(x: 50, y: 300, width: 200, height: 40))
//            registerButton.backgroundColor = UIColor.green
//            registerButton.setTitle("Зарегистрироваться", for: .normal)
//            registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
//            view.addSubview(registerButton)
//        }
//
//        @objc func registerButtonTapped() {
//            // Обработка нажатия кнопки регистрации
//            // ...
//        }
//}










