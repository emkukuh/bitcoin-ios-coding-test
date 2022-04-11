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
            .foregroundColor(Colors.Gray.medium)
            .padding(.bottom, Spaces.value4)
    }

    private func renderRecieptImage() -> some View {
        HStack(alignment: .center) {
            Image(uiImage: viewModel.imageBase64.imageFromBase64)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: FrameSizes.value50,
                    height: FrameSizes.value50
                ).clipShape(
                    RoundedRectangle(cornerRadius: CornerRadiuses.value12)
                )
        }.setHidden(
            viewModel.imageBase64.isEmpty,
            isRemove: true
        )
    }

    private func renderBody() -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: Spaces.value12) {
                renderDate()
                renderTitle()
            }
            Spacer()
            HStack(alignment: .bottom, spacing: Spaces.value22) {
                renderTip()
                renderRecieptImage()
            }
        }
    }
}
