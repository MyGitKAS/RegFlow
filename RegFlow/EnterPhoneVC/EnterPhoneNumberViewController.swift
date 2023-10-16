
import UIKit
import FlagPhoneNumber
import FirebaseAuth
import FirebaseStorage

class EnterPhoneNumberViewController: UIViewController {

    @IBOutlet weak var numberAndCodeView: UIView!
    @IBOutlet weak var enterNumberTextField: FPNTextField!
    @IBOutlet weak var sendCodeButton: UIButton!

    
    var listController: FPNCountryListViewController!
    var phoneNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfiguration()
    }
    private func setConfiguration() {
        //
        sendCodeButton.skeletonButton(title: "Send Code")
        sendCodeButton.alpha = 0.5
        sendCodeButton.isEnabled = false
        
        //
        enterNumberTextField.becomeFirstResponder()
        enterNumberTextField.setFlag(key: .FR)
        enterNumberTextField.delegate = self
        enterNumberTextField.displayMode = .list
        enterNumberTextField.backgroundColor = .black
        enterNumberTextField.layer.cornerRadius = 10
        enterNumberTextField.textColor = .white
        enterNumberTextField.layer.borderWidth = 2
        enterNumberTextField.layer.borderColor = UIColor.white.cgColor
        FPNTextField.appearance().tintColor = UIColor.white
        //
        listController = FPNCountryListViewController(style: .grouped)
        listController.setup(repository: enterNumberTextField.countryRepository)
        listController.didSelect = { counry in self.enterNumberTextField.setFlag(countryCode: counry.code)
        }
        
        numberAndCodeView.isHidden = true
        numberAndCodeView.layer.cornerRadius = 10
        numberAndCodeView.backgroundColor = .clear
        numberAndCodeView.layer.borderWidth = 1
        numberAndCodeView.layer.borderColor = UIColor.green.cgColor
    }
    
    @IBAction func sendCodeButtonAction(_ sender: UIButton) {
        guard phoneNumber != nil else { return }
        
        // OFF check capcha
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
     
        FirebaseAuthPhoneService.shared.sendVerificationCode(to: phoneNumber ?? "") {
            result in
            switch result {
            case .success(let verifID):
                let vc = VerifyCodeViewController()
                     vc.verificationID = verifID
                     self.navigationController?.pushViewController(vc, animated: true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func textSwitchTapped(_ sender: UISwitch) {
        numberAndCodeView.isHidden = !sender.isOn
    }
    
}

extension EnterPhoneNumberViewController: UITextFieldDelegate {
    
    // Limits character input to textField
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

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
