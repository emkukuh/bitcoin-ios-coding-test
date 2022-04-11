//
//  Date+Extensions.swift
//  TipJar
//
//  Created by kukuh on 11/04/22.
//

import Foundation

extension Date {
    var mainDateFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = R.string.format.mainDateFormat()
        let date = dateFormatter.string(from: self)
        return date.stringValue
    }
}
