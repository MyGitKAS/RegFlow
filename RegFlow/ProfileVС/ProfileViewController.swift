

import UIKit

class ProfileViewController: UIViewController {

    let imageView = UIImageView()
    let nameLabel = UILabel()
    let nameTextView = UITextView()
    let infoView = ProfileIfoTextView()
    let logOutButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setConfiguration()
        setConstraints()
    }
    
    private func setConfiguration() {
        view.backgroundColor = .black
        view.addSubview(imageView)
        view.addSubview(nameTextView)
        view.addSubview(infoView)
        view.addSubview(logOutButton)
        //
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 180 / 2
        let newSize = CGSize(width: 130, height: 130)
        imageView.image = UIImage(named: "EmptyUserPhoto")?.resizeImage(to: newSize)
        imageView.contentMode = .center
        imageView.lightEffect()
        //
        nameTextView.backgroundColor = .clear
        nameTextView.text = "Name Name"
        nameTextView.textColor = .white
        nameTextView.textAlignment = .center
        nameTextView.font = UIFont(name: "Futura", size: 25)
        //
        logOutButton.skeletonButton(title: "Log Out")
        logOutButton.layer.borderColor = UIColor.red.cgColor
        logOutButton.setTitleColor(.red, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    @objc func logOutButtonTapped(_ sender: UIButton) {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension ProfileViewController {
    func setConstraints() {

        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        infoView.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            //
            nameTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            nameTextView.widthAnchor.constraint(equalToConstant: 200),
            nameTextView.heightAnchor.constraint(equalToConstant: 50),
            //
            infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 20),
            infoView.widthAnchor.constraint(equalToConstant: 330),
            //
            logOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logOutButton.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 80),
            logOutButton.widthAnchor.constraint(equalToConstant: 200),
            logOutButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}


