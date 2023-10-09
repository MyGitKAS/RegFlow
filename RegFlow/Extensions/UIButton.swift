
import UIKit

extension UIButton {
    func skeletonButton(){
        self.layer.cornerRadius = 10
        self.backgroundColor = .clear
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.green.cgColor
        self.setTitleColor(.green, for: .normal)
    }
}
