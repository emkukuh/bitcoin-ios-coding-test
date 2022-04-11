//
//  PaymentDetailView.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import SwiftUI

struct PaymentDetailView: View {
    @ObservedObject var viewModel: PaymentDetailViewModel
    var body: some View { renderBody() }

    private func renderImage(proxy: GeometryProxy) -> some View {
        Image(uiImage: viewModel.recieptImageBase64.imageFromBase64)
            .resizable()
            .frame(
                width: proxy.size.width - Spaces.value42,
                height: proxy.size.height / 1.6
            )
            .cornerRadius(CornerRadiuses.value12)
    }

    private func renderRecieptInfo() -> some View {
        PaymentHistoryListItemView(viewModel: viewModel.paymentListViewModel)
            .padding(Spaces.value16)
            .background(Color.white)
            .cornerRadius(CornerRadiuses.value12)
    }

    private func renderCloseButton() -> some View {
        ButtonView(
            viewModel: viewModel.closeButtonViewModel,
            style: LabelButtonViewStyle()
        )
    }

    private func renderBody() -> some View {
        GeometryReader { proxy in
            VStack {
                renderImage(proxy: proxy)
                renderRecieptInfo()
                renderCloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, Spaces.value22)
            .frame(alignment: .center)
        }
    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailView(viewModel: PaymentDetailViewModel())
            .padding(.horizontal, Spaces.value22)
    }
}
