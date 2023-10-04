//
//  VerifyCodeViewController.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 3.10.23.
//

import UIKit
import FirebaseAuth

class VerifyCodeViewController: UIViewController {
    
    
    //private let verificationID: String!
    var verificationID: String!
    private let verifyView = VerifyView()
    private lazy var checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("Check code", for: .normal)
        button.addTarget(self, action: #selector(verifyButoonAction), for: .touchUpInside)
        return button
    }()
    
    private let accessCode = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(verifyView)
        view.addSubview(checkButton)
        verifyView.verifyDelegate = self
        setConstraints()
        view.backgroundColor = .white
    }

    @objc private func verifyButoonAction() {
        verify()
        
        
        
        
        
        
        
        
        
        
        
        
// let fieldsCode = verifyView.getFieldsCode()
//        if fieldsCode == accessCode {
//            //Present next VC
//        } else {
//            showAlert()
//
//            //clear text field
//        }
//        verifyView.verifyFilds[verifyView.verifyFilds.count - 1].becomeFirstResponder()
    }

}

// MARK: -

extension VerifyCodeViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            verifyView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            verifyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            verifyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            verifyView.heightAnchor.constraint(equalToConstant: 60),
            
            checkButton.topAnchor.constraint(equalTo: verifyView.bottomAnchor, constant: 20),
            checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            verifyView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

extension VerifyCodeViewController: VerifyProtocol {
    func verify() {
        let code = verifyView.getFieldsCode()
        let credetional = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
        
        Auth.auth().signIn(with: credetional) { _, error in
            if error != nil {
                self.shake(self.verifyView)
                self.verifyView.clearAllInputFields()
                self.verifyView.verifyFilds[0].becomeFirstResponder()

            } else {
                // change to present next VC
                let ac = UIAlertController(title: "Code Correct", message: nil, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Cancel", style: .cancel)
                ac.addAction(cancel)
                self.present(ac, animated: true)
               
            }
        }
    }
}


extension VerifyCodeViewController {
    private func shake(_ object: AnyObject) {
        let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shake.values = [0, 20, -20, 0]
        shake.duration = 0.25
        shake.repeatCount = 1
        object.layer.add(shake, forKey: "shake")
    }
}



