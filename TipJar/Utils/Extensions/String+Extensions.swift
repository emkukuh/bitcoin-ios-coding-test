//
//  String+Extensions.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import Foundation

extension String {
    var doubleValue: Double {
        Double(self) ?? DefaultValues.double
    }
}
