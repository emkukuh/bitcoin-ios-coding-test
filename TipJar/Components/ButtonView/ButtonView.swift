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

    private func renderBody() -> some View {
        Button(action: viewModel.onTapHandler) {
            Text(viewModel.title)
                .font(Fonts.robotoMedium16)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: DefaultValues.cgFloat, maxWidth: .infinity)
                .background(LinearGradients.Orange.vertical)
                .cornerRadius(CornerRadiuses.value12)
        }
    }
}
