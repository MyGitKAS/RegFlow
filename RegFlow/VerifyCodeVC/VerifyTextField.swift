
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
        setConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfiguration() {
        backgroundColor = #colorLiteral(red: 0.1781766439, green: 0.1781766439, blue: 0.1781766439, alpha: 1)
        layer.cornerRadius = 10
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 1
        tintColor = .clear
        textColor = .white
        font = UIFont.systemFont(ofSize: 40)
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
        layer.borderWidth = 1
    }
}
