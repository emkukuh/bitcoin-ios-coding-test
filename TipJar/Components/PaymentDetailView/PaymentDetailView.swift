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
        Image(viewModel.recieptImageBase64)
            .resizable()
            .frame(
                width: proxy.size.width - Spaces.value42,
                height: proxy.size.height / 2
            )
            .background(Color.yellow)
            .cornerRadius(CornerRadiuses.value12)
    }

    private func renderRecieptInfo() -> some View {
//        let vm = PaymentHistoryListItemViewModel()
//        vm.tip = "10.22"
//        vm.date = "10 11 12"
//        vm.price = "200.00"
        return PaymentHistoryListItemView(viewModel: viewModel.paymentListViewModel)
            .padding()
            .background(Color.blue)
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
        }
    }
}

struct PaymentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailView(viewModel: PaymentDetailViewModel())
            .padding(.horizontal, Spaces.value22)
    }
}
