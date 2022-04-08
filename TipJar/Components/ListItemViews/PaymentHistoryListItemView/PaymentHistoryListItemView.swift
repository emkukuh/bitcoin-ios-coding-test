//
//  PaymentHistoryListItemView.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import SwiftUI

struct PaymentHistoryListItemView: View {
    @ObservedObject var viewModel: PaymentHistoryListItemViewModel
    var body: some View { renderBody() }

    private func renderDate() -> some View {
        Text(viewModel.date)
            .font(Fonts.robotoMedium16)
    }

    private func renderTitle() -> some View {
        Text(viewModel.title)
            .font(Fonts.robotoMedium24)
    }

    private func renderTip() -> some View {
        Text(viewModel.tip)
            .font(Fonts.robotoMedium16)
            .foregroundColor(Colors.Gray.light)
    }

    private func renderBody() -> some View {
        HStack(alignment: .bottom, spacing: Spaces.value22) {
            VStack(alignment: .leading, spacing: Spaces.value12) {
                renderDate()
                renderTitle()
            }
            renderTip()
            Spacer()
            Text("sd")
        }
    }
}

struct PaymentHistoryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentHistoryListItemView(viewModel: PaymentHistoryListItemViewModel())
    }
}
