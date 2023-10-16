
import UIKit


class DataView: UIView {
    
    var fieldStack = UIStackView()
    var verifyFilds = [DataTextField]()
    let datePicker = UIDatePicker()
    
    private  let placeHolderText = ["Name","Date","Email","Password","ConfirmPassword"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        verifyTextFieldConfiguration()
        setConstraints()
        verifyFilds[0].becomeFirstResponder()
        datePickerConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func datePickerConfig() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .black
        datePicker.addTarget(self, action: #selector(dateSelection), for: .valueChanged)
        datePicker.setValue(UIColor.white, forKey: "textColor")
        verifyFilds[1].inputView = datePicker
        datePicker.translatesAutoresizingMaskIntoConstraints = false
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
    @objc func dateSelection() {
         let dateFormatter = DateFormatter()
              dateFormatter.dateStyle = .medium
              dateFormatter.timeStyle = .none
        verifyFilds[1].text = dateFormatter.string(from: datePicker.date)
    }
    
    func getFieldsCode() -> String {
        var fieldsCode = ""
        verifyFilds.forEach {
            fieldsCode.append($0.text ?? "")
        }
        return fieldsCode
    }
}

extension DataView {
    private func setConstraints() {
        fieldStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fieldStack.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            fieldStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            fieldStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}



