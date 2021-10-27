//
//  RoundButton.swift
//  DhBank
//
//  Created by Lucas on 21/10/21.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
