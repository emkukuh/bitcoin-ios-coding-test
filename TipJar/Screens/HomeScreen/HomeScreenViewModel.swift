//
//  HomeScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Combine

class HomeScreenViewModel: ScreenViewModel {
    var priceAmountViewModel = AmountInputViewModel()
    var tipAmountViewModel = AmountInputViewModel()
    var stepperViewModel = StepperViewModel()
    var totalTipHorizontalListViewModel = HorizontalListItemViewModel()
    var personTipHorizontalListViewModel = HorizontalListItemViewModel()
    var takeRecieptPicCheckmarkViewModel = CheckmarkViewModel()
    var mainButtonViewMdoel = ButtonViewModel()
    private var store = Set<AnyCancellable>()
    private let defaultTipPercentage: Double = 10
    private let defaultPriceAmount: Double = 100

    override init() {
        super.init()
        setupViewModel()
        setupSubscription()
    }

    func buttonTap() {
       print("snoop doog")
    }

    private func setupViewModel() {
        tipAmountViewModel.title = R.string.title.tipPercentage()
        tipAmountViewModel.placeHolder = R.string.placeholder.amount10()
        tipAmountViewModel.value = defaultTipPercentage
        totalTipHorizontalListViewModel.title = R.string.field.totalTip()
        personTipHorizontalListViewModel.title = R.string.field.perPerson()
        mainButtonViewMdoel.title = R.string.button.savePayment()
        mainButtonViewMdoel.onTapHandler = buttonTap
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
        let totalTip = price * tipPercentage / 100
        totalTipHorizontalListViewModel.value = totalTip.amountStringFormat
        personTipHorizontalListViewModel.value = (totalTip / personCount.doubleValue).amountStringFormat
    }
}
