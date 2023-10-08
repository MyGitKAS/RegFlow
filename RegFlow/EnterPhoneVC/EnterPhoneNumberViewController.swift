//
//  EnterPhoneNumberViewController.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 24.09.23.
//

import UIKit
import FlagPhoneNumber
import FirebaseAuth
import FirebaseStorage

class EnterPhoneNumberViewController: UIViewController {

    @IBOutlet weak var showTestNumberView: UIView!
    
    
    var listController: FPNCountryListViewController!
    var phoneNumber: String?
    
    @IBOutlet weak var enterNumberTextField: FPNTextField!
    @IBOutlet weak var sendCodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
    }
    private func setupConfig() {
        //
        sendCodeButton.skeletonButton()
        sendCodeButton.alpha = 0.5
        sendCodeButton.isEnabled = false
        
        //
        enterNumberTextField.setFlag(key: .FR)
        enterNumberTextField.delegate = self
        enterNumberTextField.displayMode = .list
        enterNumberTextField.backgroundColor = .white
        //enterNumberTextField.layer.cornerRadius = 10
        //enterNumberTextField.layer.borderWidth = 1
       // enterNumberTextField.layer.borderColor = UIColor.green.cgColor
        
        //enterNumberTextField.selectedCountry?.phoneCode
        
//        enterNumberTextField.attributedPlaceholder = NSAttributedString(
//            string: "Placeholder Text",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
      //  )
        
        listController = FPNCountryListViewController(style: .grouped)
        listController.setup(repository: enterNumberTextField.countryRepository)
        listController.didSelect = { counry in self.enterNumberTextField.setFlag(countryCode: counry.code)
        }
        
        showTestNumberView.isHidden = true
        showTestNumberView.layer.cornerRadius = 10
        showTestNumberView.backgroundColor = .clear
        showTestNumberView.layer.borderWidth = 1
        showTestNumberView.layer.borderColor = UIColor.green.cgColor
    }
    
    @IBAction func sendCodeButtonAction(_ sender: UIButton) {
        guard phoneNumber != nil else { return }
        
        // OFF check capcha
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        //
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!, uiDelegate: nil) {verifID,error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            } else {
                print("OK!!!")
                //let vc = CheckCodeViewController()
                let vc = VerifyCodeViewController()
                vc.verificationID = verifID
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @IBAction func testNumberSwitch(_ sender: UISwitch) {
        UIView.animate(withDuration: 3) {
            self.showTestNumberView.isHidden = !sender.isOn
        }
        showTestNumberView.isHidden = !sender.isOn
    }
}

extension EnterPhoneNumberViewController: UITextFieldDelegate {
    
    // Limits character input to textField
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//
//       let correctNumber = enterNumberTextField.placeholder?.first?.description ?? ""
//
//       if textField.text?.count ?? 0 < 1 {
//           if string != correctNumber { return false }
//       }
          // if string != correctNumber { return false }
       
       // get the current text, or use an empty string if that failed
    let currentText = textField.text ?? ""

    // attempt to read the range they are trying to change, or exit if we can't
    guard let stringRange = Range(range, in: currentText) else { return false }

    // add their new text to the existing text
    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

    // make sure the result is under 16 characters
       return updatedText.count <= enterNumberTextField.placeholder?.count ?? 0
   }
}

extension EnterPhoneNumberViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
      //
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            sendCodeButton.alpha = 1
            sendCodeButton.isEnabled = true
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            sendCodeButton.alpha = 0.5
            sendCodeButton.isEnabled = false
        }
    }
    func fpnDisplayCountryList() {
      let navigationController = UINavigationController(rootViewController: listController)
        navigationController.title = "Country"
        enterNumberTextField.text = ""
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
}
