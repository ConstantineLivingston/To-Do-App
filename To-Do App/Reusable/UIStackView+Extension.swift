//
//  UIStackView+Extension.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
