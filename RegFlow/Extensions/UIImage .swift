//
//  UIImage .swift
//  RegFlow
//
//  Created by Алексей Кухленков on 8.10.23.
//
import UIKit

extension UIImage {
    func resizeImage(to newSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let resizedImage = renderer.image { context in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
        return resizedImage
    }
}
