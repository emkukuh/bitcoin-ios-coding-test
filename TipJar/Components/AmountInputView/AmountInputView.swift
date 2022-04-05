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
    var body: some View { renderBody() }

    init(viewModel: AmountInputViewModel) {
        self.viewModel = viewModel
    }

    private func renderTitle() -> some View {
        Text("Enter Amount")
            .font(Fonts.robotoMedium16)
    }

    private func renderTextfield() -> some View {
        HStack {
            Text(Symbols.dollar)
                .padding(.leading, Spaces.value22)
                .font(Fonts.robotoMedium24)
            TextField("100.00", text: $viewModel.value)
                .font(Fonts.robotoMedium42)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)
                .padding(.leading, -Spaces.value22)
                .clipped()
            
        }.frame(height: FrameHeight.value82)
        .overlay(
            RoundedRectangle(cornerRadius: CornerRadiuses.value12)
                .stroke(
                    Colors.Gray.lighter,
                    lineWidth: 1
                )
                .shadow(color: Colors.Gray.lighter, radius: 2, x: 1, y: 2)
                .clipShape(RoundedRectangle(cornerRadius: CornerRadiuses.value12))
        )
    }

    private func renderBody() -> some View {
        VStack(alignment: .leading, spacing: Spaces.value16) {
            renderTitle()
            renderTextfield()
        }
    }
}
