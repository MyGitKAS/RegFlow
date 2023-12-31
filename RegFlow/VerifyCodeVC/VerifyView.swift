
import UIKit

protocol VerifyProtocol: AnyObject {
    func verify()
}

class VerifyView: UIView {
    
    weak var verifyDelegate: VerifyProtocol?
    var fieldStack = UIStackView()
    var verifyFilds = [VerifyTextField]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfiguration()
        setConstraints()
        translatesAutoresizingMaskIntoConstraints = false
        verifyFilds[0].becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfiguration() {
        fieldStack.translatesAutoresizingMaskIntoConstraints = false
        fieldStack.spacing = 5
        fieldStack.distribution = .fillEqually
        
        for numb in 0...5 {
            let verifyTextField = VerifyTextField()
            verifyTextField.tag = numb
            verifyTextField.fieldsDelegate = self
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

extension VerifyView: FieldsProtocol {
    
    func activeNextField(tag: Int) {
        if tag != verifyFilds.count - 1 {
            verifyFilds[tag + 1].becomeFirstResponder()
        } else {
            // Check metod
            verifyDelegate?.verify()
        }
    }
    
    func activePreviousField(tag: Int) {
        if tag != 0 {
            verifyFilds[tag - 1].text = ""
            verifyFilds[tag - 1].becomeFirstResponder()
        }
    }
}

extension VerifyView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            fieldStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            fieldStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}

extension VerifyView {
    func clearAllInputFields() {
        verifyFilds.forEach {$0.text = ""}
    }
}
