//
//  HomeScreen.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import SwiftUI

struct HomeScreen: ScreenContent {
    @ObservedObject var viewModel: HomeScreenViewModel
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
            viewModel: viewModel.totalTipHorizontalListViewModel,
            style: SmallHorizontalListItemViewStyle()
        )
    }

    private func renderPersonTip() -> some View {
        HorizontalListItemView(
            viewModel: viewModel.personTipHorizontalListViewModel,
            style: MediumHorizontalListItemViewStyle()
        )
    }

    private func renderTipInfoList() -> some View {
        VStack(spacing: Spaces.value16) {
            renderTotalTip()
            renderPersonTip()
        }
    }

    private func renderRecieptPicCheckmark() -> some View {
        CheckmarkView(
            viewModel: viewModel.takeRecieptPicCheckmarkViewModel
        ).padding(.top, Spaces.value42)
    }

    private func renderMainButton() -> some View {
        ButtonView(viewModel: viewModel.mainButtonViewMdoel)
    }

    private func renderBody() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spaces.value32) {
                renderPriceAmountInputView()
                renderStepperView()
                renderTipAmountInputView()
                renderTipInfoList()
                renderRecieptPicCheckmark()
                renderMainButton()
                Spacer()
            }
            .padding([.leading, .trailing], Spaces.value24)
            .padding(.top, Spaces.value16)
        }
    }
}
