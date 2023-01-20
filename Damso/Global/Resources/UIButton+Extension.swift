//
//  UIButton+Extension.swift
//  Damso
//
//  Created by 문정호 on 2023/01/21.
//

import Foundation
import UIKit

extension UIButton {
    func setUnderlined() {
        guard let title = title(for: .normal) else {return}
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location:0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}
