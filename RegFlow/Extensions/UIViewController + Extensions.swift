

import UIKit

extension UIViewController {
    func showAlert(message: String) -> UIAlertController {
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        return alertController
        //there may be a closure here
    }
}
