//
//  Numbers+Extension.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Foundation

extension Hashable {
    var stringValue: String { "\(self)" }
}

extension Int {
    var stringValue: String { "\(self)" }
    var doubleValue: Double { Double(self) }
}
