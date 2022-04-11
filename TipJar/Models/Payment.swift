//
//  Payment.swift
//  TipJar
//
//  Created by kukuh on 11/04/22.
//

import Foundation
import RealmSwift

class Payment: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: UUID
    @Persisted var price: Double
    @Persisted var tip: Double
    @Persisted var imageBase64: String
}
