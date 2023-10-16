
import UIKit

extension UIButton {
    func skeletonButton(title text: String){
        self.layer.cornerRadius = 20
        self.backgroundColor = .clear
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.green.cgColor
        self.setTitle(text, for: .normal)
        self.setTitleColor(.green, for: .normal)
    }
}

extension UIButton {
    func crossButton(){
        let point = CGPoint(x: 100, y: 100)
        let size = CGSize(width: 30, height: 30)
        self.frame(forAlignmentRect: CGRect(origin: point, size: size))
        self.setImage(UIImage(named: "cross_icon"), for: .normal)
      
    }
}
