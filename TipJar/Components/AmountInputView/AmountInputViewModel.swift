//
//  AmountInputViewModel.swift
//  TipJar
//
//  Created by kukuh on 05/04/22.
//

import Foundation

class AmountInputViewModel: ObservableObject {
    @Published var value: Double = DefaultValues.double
    var title: String = R.string.title.enterAmount()
    var placeHolder: String = R.string.placeholder.amount100()
}
