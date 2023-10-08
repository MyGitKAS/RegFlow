//
//  UIButton.swift
//  RegFlow
//
//  Created by Алексей Кухленков on 8.10.23.
//

import UIKit

extension UIButton {
    func skeletonButton(){
        self.layer.cornerRadius = 10
        self.backgroundColor = .clear
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.green.cgColor
        self.titleLabel?.textColor = .green
    }
}
