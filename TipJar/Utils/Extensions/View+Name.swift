//
//  View+Name.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import Foundation
import SwiftUI

extension View {
    static var name: String {
        return String(describing: self)
    }
}
