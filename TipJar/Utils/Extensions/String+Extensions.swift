//
//  String+Extensions.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import Foundation
import UIKit

extension String {
    var doubleValue: Double {
        Double(self) ?? DefaultValues.double
    }
    var imageFromBase64: UIImage {
        guard let data = Data(base64Encoded: self) else { return UIImage() }
        let image = UIImage(data: data)
        return image ?? UIImage()
    }
}
