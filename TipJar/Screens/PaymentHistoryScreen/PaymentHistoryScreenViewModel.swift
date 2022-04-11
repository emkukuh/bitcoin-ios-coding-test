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
    @Published var isRecieptPresented: Bool = false
    @Published var paymentDetailViewModel = PaymentDetailViewModel()
    @ObservedResults(Payment.self) var payments

    override init() {
        super.init()
        setupViewModel()
    }

    private func setupViewModel() {
        paymentHistoryItemViewModels = payments.map { payment in
            let item = PaymentHistoryListItemViewModel()
            item.price = payment.price.amountStringFormat
            item.imageBase64 = payment.imageBase64
            item.date = Date().stringValue
            item.tip = payment.tip.amountStringFormat
            return item
        }
        paymentDetailViewModel.closeButtonViewModel.onTapHandler = {
            self.isRecieptPresented = false
        }
    }

    func listTapHandler(_ id: UUID) {
        let selectedIndex = paymentHistoryItemViewModels.getIndexById(id)
        let selectedPayment = payments[selectedIndex]
        if selectedPayment.imageBase64.isEmpty {
             return
        }
        paymentDetailViewModel.recieptImageBase64 = selectedPayment.imageBase64
        paymentDetailViewModel.paymentListViewModel.price = selectedPayment.price.amountStringFormat
        paymentDetailViewModel.paymentListViewModel.tip = selectedPayment.tip.amountStringFormat
        paymentDetailViewModel.paymentListViewModel.date = selectedPayment.date.stringValue
        isRecieptPresented = true
    }
}
