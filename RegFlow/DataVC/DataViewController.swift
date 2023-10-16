
import UIKit
import Firebase
import FirebaseFirestore

class DataViewController: UIViewController {
    
    let dataView = DataView()
    let createUserButton = UIButton()
    let crossButton =  UIButton()
    let topLabel =  UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        createUserButton.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.addSubview(dataView)
        view.addSubview(topLabel)
        view.addSubview(createUserButton)
        view.addSubview(crossButton)
        
        setConstraints()
        setConfiguration() 
    }
    
    private func setConfiguration() {
        createUserButton.skeletonButton(title: "Create")
        createUserButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        //
        crossButton.crossButton()
        crossButton.addTarget(self, action: #selector(crossButtonTapped), for: .touchUpInside)
        //
        topLabel.theTopLabel(text: "Give your data to the Matrix.")
    }
    
    @objc func crossButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func createButtonTapped() {
        let name = dataView.verifyFilds[0].text ?? "Empty"
        let date = dataView.verifyFilds[1].text ?? "Empty"
        let email = dataView.verifyFilds[2].text ?? "Empty"
        let password = dataView.verifyFilds[3].text ?? "Empty"
        let confirmPassword = dataView.verifyFilds[4].text

        if password == confirmPassword {
            let user = LocalUser(name: name, date: date, email: email, password: password)
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
        createUserButton.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        dataView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            //+
            crossButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
            crossButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            //
            topLabel.topAnchor.constraint(equalTo: crossButton.bottomAnchor, constant: 60),
            topLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 50),
            topLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -50),
            topLabel.heightAnchor.constraint(equalToConstant: 150),
            //
            dataView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 50),
            dataView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 50),
            dataView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -50),
            dataView.heightAnchor.constraint(equalToConstant: 250),
            //
            createUserButton.topAnchor.constraint(equalTo: dataView.bottomAnchor, constant: 60),
            createUserButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 50),
            createUserButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -50),
            createUserButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}


