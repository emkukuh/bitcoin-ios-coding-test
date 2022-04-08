//
//  PaymentHistoryListItemViewModel.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import Foundation

class PaymentHistoryListItemViewModel: ObservableObject, Identifiable {
    let id = UUID()
    var title: String = DefaultValues.string
    var date: String = DefaultValues.string
    var tip: String = DefaultValues.string
    var imageString: String = DefaultValues.string
}
