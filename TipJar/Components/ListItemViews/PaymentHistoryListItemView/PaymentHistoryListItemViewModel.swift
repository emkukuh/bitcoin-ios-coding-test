//
//  PaymentHistoryListItemViewModel.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import Foundation

class PaymentHistoryListItemViewModel: ObservableObject, Identifiable {
    let id = UUID()
    var price: String = DefaultValues.string
    var date: String = DefaultValues.string
    var tip: String = DefaultValues.string
    var imageBase64: String = DefaultValues.string
}

extension Array where Element == PaymentHistoryListItemViewModel {
    func getIndexById(_ id: UUID) -> Int {
        firstIndex(where: { $0.id == id }) ?? DefaultValues.int
    }
}
