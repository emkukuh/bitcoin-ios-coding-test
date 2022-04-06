//
//  MainScreen.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel = MainScreenViewModel()
    var body: some View { renderBody() }

    private func renderPriceAmountInputView() -> some View {
        AmountInputView(viewModel: viewModel.priceAmountViewModel)
    }

    private func renderTipAmountInputView() -> some View {
        AmountInputView(
            viewModel: viewModel.tipAmountViewModel,
            style: TipAmountInputViewStyle()
        )
    }

    private func renderStepperView() -> some View {
        StepperView(viewModel: viewModel.stepperViewModel)
    }

    private func renderTotalTip() -> some View {
        HorizontalListItemView(
            viewModel: viewModel.totalTipHorizontalListViewModel
        )
    }

    private func renderPersonTip() -> some View {
        HorizontalListItemView(
            viewModel: viewModel.totalTipHorizontalListViewModel
        )
    }

    private func renderTipInfoList() -> some View {
        VStack(spacing: Spaces.value16) {
            renderTotalTip()
            renderPersonTip()
        }
    }

    private func renderMainButton() -> some View {
        Button(action: viewModel.buttonTap) {
            Text("Save Payment")
                .font(Fonts.robotoMedium16)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: DefaultValues.cgFloat, maxWidth: .infinity)
                .background(LinearGradients.Orange.vertical)
                .cornerRadius(CornerRadiuses.value12)
        }
    }

    private func renderBody() -> some View {
        ScrollView {
            VStack(spacing: Spaces.value32) {
                renderPriceAmountInputView()
                renderStepperView()
                renderTipAmountInputView()
                renderTipInfoList()
                renderMainButton()
                Spacer()
            }
            .padding([.leading, .trailing], Spaces.value24)
            .padding(.top, Spaces.value16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
