

import UIKit

extension UIViewController {
    func showAlert(message: String) -> UIAlertController {
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
        return alertController
        //there may be a closure here
    }
}
