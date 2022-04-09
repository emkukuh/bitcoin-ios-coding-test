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
            .foregroundColor(Color.black)
    }

    private func renderTitle() -> some View {
        Text(viewModel.price)
            .font(Fonts.robotoMedium24)
            .foregroundColor(Color.black)
    }

    private func renderTip() -> some View {
        Text(R.string.format.tip(viewModel.tip))
            .font(Fonts.robotoMedium16)
            .foregroundColor(Colors.Gray.light)
            .padding(.bottom, Spaces.value4)
    }

    private func renderRecieptImage() -> some View {
        Text("sd")
            .padding(.bottom, Spaces.value4)
    }

    private func renderBody() -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: Spaces.value12) {
                renderDate()
                renderTitle()
            }
            Spacer()
            HStack(spacing: Spaces.value22) {
                renderTip()
                renderRecieptImage()
            }
        }
    }
}

struct PaymentHistoryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PaymentHistoryListItemView(viewModel: PaymentHistoryListItemViewModel())
            PaymentHistoryListItemView(viewModel: PaymentHistoryListItemViewModel())
        }
    }
}
