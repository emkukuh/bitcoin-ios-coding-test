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
    private let defaultTipPercentage: Double = 10
    private let defaultPriceAmount: Double = 100

    init() {
        setupViewModel()
        setupSubscription()
    }

    func buttonTap() {
       
    }

    private func setupViewModel() {
        tipAmountViewModel.title = R.string.title.tipPercentage()
        tipAmountViewModel.value = defaultTipPercentage
        totalTipHorizontalListViewModel.title = R.string.field.totalTip()
        personTipHorizontalListViewModel.title = R.string.field.perPerson()
    }

    private func setupSubscription() {
        priceAmountViewModel.$value
            .combineLatest(tipAmountViewModel.$value)
            .combineLatest(stepperViewModel.$value)
            .sink { (amount, person) in
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
        var price = price
        if price == DefaultValues.double {
            price = defaultPriceAmount
        }
        let totalTip = price / personCount.doubleValue * tipPercentage / 100
        totalTipHorizontalListViewModel.value = totalTip.stringValue
        personTipHorizontalListViewModel.value = (totalTip / personCount.doubleValue).stringValue
    }
}
