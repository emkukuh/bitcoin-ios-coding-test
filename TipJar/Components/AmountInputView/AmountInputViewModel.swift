//
//  AmountInputViewModel.swift
//  TipJar
//
//  Created by kukuh on 05/04/22.
//

import Foundation

class AmountInputViewModel: ObservableObject {
    @Published var value: String = DefaultValues.string
}
