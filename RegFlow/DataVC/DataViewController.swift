
import UIKit

class DataViewController: UIViewController {
    
    let dataView = DataView()
    let createUserButton = UIButton()
    let topLabel: UILabel = {
    let label = UILabel()
    label.text = "Give your data to the Matrix."
    label.textColor = .white
    label.textAlignment = .center
    label.font = UIFont(name: "Courier", size: 25)
        label.numberOfLines = 0
   return label
}()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(dataView)
        view.addSubview(topLabel)
        view.addSubview(createUserButton)
        
        setConstraints()
        setConfigure()
    }
    
    private func setConfigure() {
        let yOffset: CGFloat = 500
        let offset = 100
        //
        createUserButton.setTitle("Create", for: .normal)
        createUserButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        createUserButton.frame = CGRect(x: (offset / 2), y: Int(yOffset) , width: Int(view.frame.width) - offset, height: 40)
        createUserButton.skeletonButton()
        //
        topLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 250)
    }

    @objc func createButtonTapped() {
        let name = dataView.verifyFilds[0].text ?? "non"
        let date = dataView.verifyFilds[1].text ?? "non"
        let email = dataView.verifyFilds[2].text ?? "non"
        let password = dataView.verifyFilds[3].text ?? "non"
        let confirmPassword = dataView.verifyFilds[4].text

        if password == confirmPassword {
            let user = User(name: name, date: date, email: email, password: password)
            let db = DatabaseService()
            db.saveUser(user)
            let vc = AddImageViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            present(showAlert(message: "Passwords must match!"), animated: true)
            dataView.verifyFilds[3].text = ""
            dataView.verifyFilds[4].text = ""
        }
    }
}

extension DataViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dataView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            dataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            dataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            dataView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
}

extension DataViewController {
    func showAlert() -> UIAlertController {
        let alertController = UIAlertController(title: nil, message: "Wrong!!!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        return alertController
    }
}

