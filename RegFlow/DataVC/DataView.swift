//
//  DataView.swift
//  TeSSSttt
//
//  Created by Алексей Кухленков on 7.10.23.
//

import UIKit


class DataView: UIView {
    
    var fieldStack = UIStackView()
    var verifyFilds = [DataTextField]()
    
    private  let placeHolderText = ["Name","Date","Email","Password","ConfirmPassword"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        fieldStack.translatesAutoresizingMaskIntoConstraints = false
        verifyTextFieldConfiguration()
        setConstraints()
        verifyFilds[0].becomeFirstResponder()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func verifyTextFieldConfiguration() {
        fieldStack.spacing = 15
        fieldStack.distribution = .fillEqually
        fieldStack.axis = .vertical
        
        for numb in 0...4 {
            let verifyTextField = DataTextField()
            verifyTextField.attributedPlaceholder = NSAttributedString(string: placeHolderText[numb], attributes: [.foregroundColor: UIColor.gray])
            verifyTextField.tag = numb
            verifyFilds.append(verifyTextField)
            fieldStack.addArrangedSubview(verifyTextField)
        }
        addSubview(fieldStack)
    }
    
    func getFieldsCode() -> String {
        var fieldsCode = ""
        verifyFilds.forEach {
            fieldsCode.append($0.text ?? "")
        }
        return fieldsCode
    }
}

//MARK: -
extension DataView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            fieldStack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            fieldStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            fieldStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}



//extension DataView {
//    func gatherDataFromTextFields() {
//
//        if let text2 = verifyFilds[0].text {
//            UserDefaults.standard.set(text2, forKey: "Name")
//        }
//
//        if let text3 = verifyFilds[1].text {
//            UserDefaults.standard.set(text3, forKey: "Nickname")
//        }
//
//        if let text4 = verifyFilds[2].text {
//            UserDefaults.standard.set(text4, forKey: "Email")
//        }
//
//        if let text5 = verifyFilds[3].text {
//            UserDefaults.standard.set(text5, forKey: "Password")
//        }
//
//    }
//
//}
//
//extension DataView {
//    func createString() -> String {
//        let name = UserDefaults.standard.string(forKey: "Name") ?? "?????"
//        let nickName = UserDefaults.standard.string(forKey: "Nickname") ?? "?????"
//        let email = UserDefaults.standard.string(forKey: "email") ?? "?????"
//        let pass = UserDefaults.standard.string(forKey: "Password") ?? "?????"
//
//        let str = """
//    Your data has been successfully placed into the matrix.
//    Name: \(name)
//    Nickname: \(nickName)
//    Email: \(email)
//    Password: \(pass)
//    """
//        return str
//    }
//}
