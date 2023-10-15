
import UIKit

extension UILabel {
    func theTopLabel(text: String) {
        self.text = text
        textColor = .white
        textAlignment = .center
        font = UIFont(name: "Futura Medium", size: 40)
        numberOfLines = 0
        
    }
}
