//
//  UIViewController + Extensions.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 4.10.23.
//

import UIKit

extension UIViewController {
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
        // тут может быть замыкание
    }
}
