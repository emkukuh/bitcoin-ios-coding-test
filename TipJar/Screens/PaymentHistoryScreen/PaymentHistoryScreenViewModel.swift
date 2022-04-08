//
//  PaymentHistoryScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import Foundation

struct Data: Identifiable {
    let id = UUID()
    let name: String
}

class PaymentHistoryScreenViewModel: ScreenViewModel {
    var datas: [Data] = [
        Data(name: "abc"),
        Data(name: "def"),
        Data(name: "hij"),
        Data(name: "klm"),
    ]
}
