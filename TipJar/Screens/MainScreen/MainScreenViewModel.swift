//
//  MainScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    var priceAmountViewModel = AmountInputViewModel()
    var tipAmountViewModel = AmountInputViewModel()
    var stepperViewModel = StepperViewModel()

    func buttonTap() {
        print(priceAmountViewModel.value / stepperViewModel.value.doubleValue)
    }
}
