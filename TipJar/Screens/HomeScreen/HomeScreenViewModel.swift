//
//  HomeScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Combine
import RealmSwift

class HomeScreenViewModel: ScreenViewModel {
    @ObservedResults(Payment.self) var payments
    var priceAmountViewModel = AmountInputViewModel()
    var tipAmountViewModel = AmountInputViewModel()
    var stepperViewModel = StepperViewModel()
    var totalTipHorizontalListViewModel = HorizontalListItemViewModel()
    var personTipHorizontalListViewModel = HorizontalListItemViewModel()
    var takeRecieptPicCheckmarkViewModel = CheckmarkViewModel()
    var mainButtonViewMdoel = ButtonViewModel()
    @Published var recieptImageBase64: String = DefaultValues.string
    private var store = Set<AnyCancellable>()
    private let defaultTipPercentage: Double = 10
    private let defaultPriceAmount: Double = 100
    private let defaultPersonCount: Int = 1

    override init() {
        super.init()
        setupViewModel()
        setupSubscription()
    }

    private func setupViewModel() {
        tipAmountViewModel.title = R.string.title.tipPercentage()
        tipAmountViewModel.placeHolder = R.string.placeholder.amount10()
        tipAmountViewModel.value = defaultTipPercentage
        totalTipHorizontalListViewModel.title = R.string.field.totalTip()
        personTipHorizontalListViewModel.title = R.string.field.perPerson()
        mainButtonViewMdoel.title = R.string.button.savePayment()
        mainButtonViewMdoel.onTapHandler = submitPaymentHandler
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


    private func submitPaymentHandler() {
        let payment = Payment()
        var price = priceAmountViewModel.value
        if price.isZero {
            price = defaultPriceAmount
        }
        payment.price = price
        payment.tip = personTipHorizontalListViewModel.value.doubleValue
        payment.imageBase64 = recieptImageBase64
        $payments.append(payment)
        print(payments)
        resetFields()
    }

    private func resetFields() {
        priceAmountViewModel.value = DefaultValues.double
        tipAmountViewModel.value = defaultTipPercentage
        stepperViewModel.value = defaultPersonCount
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
