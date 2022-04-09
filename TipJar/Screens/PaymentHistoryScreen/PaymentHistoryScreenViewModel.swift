//
//  PaymentHistoryScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import Foundation

class PaymentHistoryScreenViewModel: ScreenViewModel {
    @Published var paymentHistoryItemViewModels = [PaymentHistoryListItemViewModel]()

    override init() {
        super.init()
        for i in 0...10 {
            let item = PaymentHistoryListItemViewModel()
            item.title = "title \(i)"
            item.date = "date \(i)"
            item.tip = "tip \(i)"
            paymentHistoryItemViewModels.append(item)
        }
    }
}
