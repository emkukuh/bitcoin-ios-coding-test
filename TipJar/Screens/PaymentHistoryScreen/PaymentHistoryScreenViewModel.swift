//
//  PaymentHistoryScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import Foundation
import RealmSwift

class PaymentHistoryScreenViewModel: ScreenViewModel {
    @Published var paymentHistoryItemViewModels = [PaymentHistoryListItemViewModel]()
    @ObservedResults(Payment.self) var payments

    override init() {
        super.init()
        payments.forEach { payment in
            let item = PaymentHistoryListItemViewModel()
            item.title = payment.price.amountStringFormat
            item.date = Date().stringValue
            item.tip = payment.tip.amountStringFormat
            paymentHistoryItemViewModels.append(item)
        }
    }
}
