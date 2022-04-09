//
//  AmountInputView.swift
//  TipJar
//
//  Created by kukuh on 05/04/22.
//

import Foundation
import SwiftUI

struct AmountInputView: View {
    @ObservedObject var viewModel = AmountInputViewModel()
    let style: AmountInputViewStyle
    var body: some View { renderBody() }

    init(
        viewModel: AmountInputViewModel,
        style: AmountInputViewStyle = MainAmountInputViewStyle()
    ) {
        self.viewModel = viewModel
        self.style = style
    }

    private func renderTitle() -> some View {
        Text(viewModel.title)
            .font(Fonts.robotoMedium16)
    }

    private func renderSymbol() -> some View {
        Text(style.symbol)
            .font(Fonts.robotoMedium24)
    }

    private func renderTextfield() -> some View {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = DefaultValues.string
        return TextField(
            viewModel.placeHolder,
            value: $viewModel.value,
            formatter: formatter
        )
            .font(Fonts.robotoMedium42)
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.center)
            .padding(
                .leading,
                style.symbolAlignment == .leading
                ? -Spaces.value10
                : DefaultValues.cgFloat
            )
            .padding(
                .trailing,
                style.symbolAlignment == .trailing
                ? -Spaces.value10
                : DefaultValues.cgFloat
            )
            .clipped()
    }
    
    private func renderBody() -> some View {
        VStack(alignment: .leading, spacing: Spaces.value16) {
            renderTitle()
            HStack {
                renderSymbol()
                    .padding(.leading, Spaces.value10)
                    .setHidden(style.symbolAlignment != .leading, isRemove: true)
                renderTextfield()
                renderSymbol()
                    .padding(.trailing, Spaces.value10)
                    .setHidden(style.symbolAlignment != .trailing, isRemove: true)
            }
            .frame(height: FrameSizes.value82)
            .padding(.horizontal, Spaces.value12)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadiuses.value12)
                    .stroke(
                        Colors.Gray.light,
                        lineWidth: 1
                    )
                    .shadow(color: Colors.Gray.light, radius: 2, x: 1, y: 2)
                    .clipShape(RoundedRectangle(cornerRadius: CornerRadiuses.value12))
            )
        }
    }
}
