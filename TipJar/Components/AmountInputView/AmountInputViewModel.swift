//
//  AmountInputViewModel.swift
//  TipJar
//
//  Created by kukuh on 05/04/22.
//

import Foundation

class AmountInputViewModel: ObservableObject {
    var title: String = R.string.title.enterAmount()
    @Published var value: Double = DefaultValues.double
}
