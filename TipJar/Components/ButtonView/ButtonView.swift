//
//  ButtonView.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import Foundation
import SwiftUI

struct ButtonView: View {
    @ObservedObject var viewModel: ButtonViewModel
    var body: some View { renderBody() }

    private func renderIcon() -> some View {
        Image(viewModel.iconName)
            .font(Fonts.robotoMedium16)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: DefaultValues.cgFloat, maxWidth: .infinity)
            .cornerRadius(CornerRadiuses.value12)
            .setHidden(viewModel.iconName.isEmpty, isRemove: true)
    }

    private func renderTitle() -> some View {
        Text(viewModel.title)
            .font(Fonts.robotoMedium16)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: DefaultValues.cgFloat, maxWidth: .infinity)
            .background(LinearGradients.Orange.vertical)
            .cornerRadius(CornerRadiuses.value12)
            .setHidden(viewModel.title.isEmpty, isRemove: true)
    }

    private func renderBody() -> some View {
        Button(action: viewModel.onTapHandler) {
            HStack {
                renderTitle()
                renderIcon()
            }
        }.setHidden(viewModel.isHidden, isRemove: true)
    }
}
