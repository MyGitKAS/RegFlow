//
//  MyDataViewController.swift
//  TeSSSttt
//
//  Created by Алексей Кухленков on 7.10.23.
//

import UIKit

class MyDataViewController: UIViewController {
    let TFView = DataView()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(TFView)
        setConstraints()
    }

}

extension MyDataViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            TFView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            TFView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            TFView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            TFView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
