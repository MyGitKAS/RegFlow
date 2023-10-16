

import UIKit

class ProfileIfoTextView: UIStackView {
    
    
    private let texts = ["Date", "Email", "Telegram", "City", "Password"]
    private var textFildArray = [UITextField]()
    private var sendTag: Int?
    private let acceptButton: UIButton = {
        let editButton = UIButton(type: .system)
        editButton.setTitle("Accept", for: .normal)
        editButton.setTitleColor(.cyan, for: .normal)
        editButton.addTarget(self, action: #selector(acceptButtonTapped(_:)), for: .touchUpInside)
        editButton.isHidden = false
        editButton.backgroundColor = .black
        return editButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 0
        backgroundColor = .clear
        setConfiguration()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfiguration() {
        for text in texts {
            let textField = UITextField()
            textField.text = text
            textField.isEnabled = false
            textField.backgroundColor = .black
            textField.textColor = .green
            textFildArray.append(textField)
            
            // Create Label
            let label = UILabel()
            label.text = text
            label.font = label.font.withSize(10)
            label.backgroundColor = .black
            label.textColor = .white
            
            // Create Button "Edit"
            let editButton = UIButton(type: .system)
            editButton.setTitle("Edit", for: .normal)
            editButton.titleLabel?.textColor = .cyan
            editButton.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
            editButton.isHidden = false
            editButton.backgroundColor = .black
            editButton.tag = texts.firstIndex(of: text) ?? 0
            
            // Create line
            let line = UIView()
            line.backgroundColor = .white
            line.translatesAutoresizingMaskIntoConstraints = false
            
            // Create horisontal stack
            let subStackView = UIStackView()
            subStackView.axis = .horizontal
            subStackView.spacing = 5
            subStackView.addArrangedSubview(label)
            subStackView.addArrangedSubview(textField)
            subStackView.addArrangedSubview(editButton)
            subStackView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addArrangedSubview(subStackView)
            self.addArrangedSubview(line)

            // Activate constraint
            subStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            subStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            subStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            //
            editButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            editButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            //
            label.widthAnchor.constraint(equalToConstant: 50).isActive = true
            //
            line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
        self.addArrangedSubview(acceptButton)
        
    }
    
    @objc  func acceptButtonTapped(_ sender: UIButton) {
        guard let tag = sendTag else { return }
        textFildArray[tag].isEnabled = false
        textFildArray[tag].resignFirstResponder()
      }
    
    @objc  func editButtonTapped(_ sender: UIButton) {
        textFildArray[sender.tag].isEnabled = true
        textFildArray[sender.tag].becomeFirstResponder()
        sendTag = sender.tag
      }
}
