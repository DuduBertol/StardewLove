//
//  Stardew_Vaelly.swift
//  Nano02
//
//  Created by Eduardo Bertol on 23/09/25.
//

import UIKit

extension UIFont {
    func stardew(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Stardew Valley", size: size) else {
            return UIFont.systemFont(ofSize: size)
        }

        return font
    }
}
