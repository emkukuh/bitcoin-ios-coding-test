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
        $recieptImageBase64.sink { imageBase64 in
            if imageBase64.isEmpty {
                self.takeRecieptPicCheckmarkViewModel.isChecked = false
            }
        }.store(in: &store)
    }

    private func submitPaymentHandler() {
        let payment = Payment()
        var price = priceAmountViewModel.value
        if price.isZero {
            price = defaultPriceAmount
        }
        payment.price = price
        payment.tip = getPersonTip(
            price: price,
            personCount: stepperViewModel.value,
            tipPercentage: tipAmountViewModel.value
        )
        payment.imageBase64 = recieptImageBase64
        $payments.append(payment)
        resetFields()
    }

    private func resetFields() {
        priceAmountViewModel.value = DefaultValues.double
        tipAmountViewModel.value = defaultTipPercentage
        stepperViewModel.value = defaultPersonCount
        recieptImageBase64 = DefaultValues.string
    }

    func getPersonTip(
        price: Double,
        personCount: Int,
        tipPercentage: Double
    ) -> Double {
        let totalTip = getTotalTip(price: price, tipPercentage: tipPercentage)
        return totalTip / personCount.doubleValue
    }

    func getTotalTip(price: Double, tipPercentage: Double) -> Double {
        var price = price
        if price == DefaultValues.double {
            price = defaultPriceAmount
        }
        return price * tipPercentage / 100
    }

    private func calculateTipInfo(
        price: Double,
        personCount: Int,
        tipPercentage: Double
    ) {
        let totalTip = getTotalTip(price: price, tipPercentage: tipPercentage)
        totalTipHorizontalListViewModel.value = totalTip.amountStringFormat()
        personTipHorizontalListViewModel.value = (totalTip / personCount.doubleValue).amountStringFormat()
    }
}
