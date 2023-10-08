//
//  VerifyTextField.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 3.10.23.
//

import UIKit


protocol FieldsProtocol: AnyObject {
    func activeNextField(tag: Int)
    func activePreviousField(tag: Int)
}

class VerifyTextField: UITextField {
    
    weak var fieldsDelegate: FieldsProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 10
        layer.borderColor = UIColor.green.cgColor
        tintColor = .clear
        textColor = .white
        attributedPlaceholder = NSAttributedString(string: "", attributes: [.font: UIFont.systemFont(ofSize: 44)])
        textAlignment = .center
    }
    
    override func deleteBackward() {
        fieldsDelegate?.activePreviousField(tag: tag)
        
    }
}

//MARK: - UITextFieldDelegate

extension VerifyTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        text = string
        
        if range.length == 0 {
            fieldsDelegate?.activeNextField(tag: tag)
            resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 3
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
}
