//
//  MainScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    var amountInputViewModel = AmountInputViewModel()

    func buttonTap() {
        amountInputViewModel.value = "200"
    }
}
