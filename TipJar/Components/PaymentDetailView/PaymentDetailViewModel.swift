//
//  PaymentDetailViewModel.swift
//  TipJar
//
//  Created by kukuh on 11/04/22.
//

import Foundation

class PaymentDetailViewModel: ObservableObject {
    var closeButtonViewModel = ButtonViewModel()
    @Published var recieptImageBase64: String = DefaultValues.string
    @Published var paymentListViewModel = PaymentHistoryListItemViewModel()

    init() {
        closeButtonViewModel.title = R.string.button.close()
    }
}
