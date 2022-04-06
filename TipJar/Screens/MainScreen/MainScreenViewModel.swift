//
//  MainScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Combine

class MainScreenViewModel: ObservableObject {
    var priceAmountViewModel = AmountInputViewModel()
    var tipAmountViewModel = AmountInputViewModel()
    var stepperViewModel = StepperViewModel()
    var totalTipHorizontalListViewModel = HorizontalListItemViewModel()
    var personTipHorizontalListViewModel = HorizontalListItemViewModel()
    var store = Set<AnyCancellable>()

    init() {
        setupViewModel()
        setupSubscription()
    }

    func buttonTap() {
        let singlePrice = priceAmountViewModel.value / stepperViewModel.value.doubleValue
        print("tip", singlePrice * tipAmountViewModel.value / 100)
    }

    private func setupViewModel() {
        tipAmountViewModel.title = "% TIP"
        totalTipHorizontalListViewModel.title = "totalaaa"
//        totalTipHorizontalListViewModel.value = "totalaaa"
        personTipHorizontalListViewModel.title = "peronnn"
//        personTipHorizontalListViewModel.value = "peronnn"
    }

    private func setupSubscription() {
        priceAmountViewModel.$value
            .combineLatest(tipAmountViewModel.$value)
            .combineLatest(stepperViewModel.$value)
            .sink { (amount, person) in
                print("price", amount.0)
                print("tip", amount.1)
                print("person", person)
                self.calculateTipInfo(
                    price: amount.0,
                    personCount: person,
                    tipPercentage: amount.1
                )
            }.store(in: &store)
    }

    private func calculateTipInfo(
        price: Double,
        personCount: Int,
        tipPercentage: Double
    ) {
        let totalTip = price / personCount.doubleValue * tipPercentage / 100
        totalTipHorizontalListViewModel.value = totalTip.stringValue
        personTipHorizontalListViewModel.value = (totalTip / personCount.doubleValue).stringValue
    }
}
