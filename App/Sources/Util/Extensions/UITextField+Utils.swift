//
//  UITextField+Utils.swift
//  Hamilton
//
//  Created by emile on 15/08/2022.
//

import UIKit

extension UITextField {
    var isValid: Bool {
        guard let text = self.text, !text.isEmpty else {
            print("Please fill the field.")
            return false
        }

        guard Double(text) != nil else {
            print("Invalid number.")
            return false
        }

        return true
    }
}
