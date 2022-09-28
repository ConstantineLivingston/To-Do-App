//
//  UIView+Extension.swift
//  To-Do App
//
//  Created by Konstantin Bratchenko on 28.09.2022.
//

import UIKit

extension UIView {
    func addConstrainedSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
