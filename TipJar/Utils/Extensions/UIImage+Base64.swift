//
//  UIImage+Base64.swift
//  TipJar
//
//  Created by kukuh on 11/04/22.
//

import Foundation
import UIKit

extension UIImage {
    var base64: String {
        jpegData(compressionQuality: 1)?
            .base64EncodedString() ?? DefaultValues.string
    }
}
