//
//  UIImageView + Extensions.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 15.10.23.
//

import Foundation
import UIKit

extension UIImageView {
    func lightEffect() {
        self.layer.shadowColor = UIColor.green.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 1
    }
}
