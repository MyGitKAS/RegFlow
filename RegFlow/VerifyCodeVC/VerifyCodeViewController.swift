
import UIKit
import FirebaseAuth

class VerifyCodeViewController: UIViewController {
    
    var verificationID: String!
    
    private let verifyView = VerifyView()
    private lazy var checkButton =  UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfiguration()
        setConstraints()
    }
    private func setConfiguration() {
        view.backgroundColor = .black
        view.addSubview(verifyView)
        view.addSubview(checkButton)
        verifyView.verifyDelegate = self
        //
        checkButton.addTarget(self, action: #selector(verifyButoonAction), for: .touchUpInside)
        checkButton.skeletonButton(title: "Check code")
    }
    
    @objc private func verifyButoonAction() {
       verify()
    }
}

// MARK: -

extension VerifyCodeViewController {
    private func setConstraints() {
       checkButton.translatesAutoresizingMaskIntoConstraints = false
        //let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            //
            verifyView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            verifyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            verifyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            verifyView.heightAnchor.constraint(equalToConstant: 70),
            //
            checkButton.topAnchor.constraint(equalTo: verifyView.bottomAnchor, constant: 40),
            checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            checkButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension VerifyCodeViewController: VerifyProtocol {
    func verify() {
        let code = verifyView.getFieldsCode()
    
        FirebaseAuthPhoneService.shared.signIn(with: code) {resultMy in
            switch resultMy {
            case .success( _):
                let vc = DataViewController()
                     vc.modalPresentationStyle = .fullScreen
                     self.present(vc, animated: true)
            case .failure( _):
                self.shake(self.verifyView)
                self.verifyView.clearAllInputFields()
                self.verifyView.verifyFilds[0].becomeFirstResponder()
            }
        }
    }
}
// MARK: - The effect of shaking with incorrect input
extension VerifyCodeViewController {
    private func shake(_ object: AnyObject) {
        let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shake.values = [0, 20, -20, 0]
        shake.duration = 0.25
        shake.repeatCount = 1
        object.layer.add(shake, forKey: "shake")
    }
}



