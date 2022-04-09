//
//  PaymentHistoryCoordinator.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import SwiftUI

struct PaymentHistoryCoordinator: View {
    @Binding var activeCoordinatorName: String?
    @State var viewModel = PaymentHistoryScreenViewModel()
    var body: some View {
        NavigationLink(
            tag: PaymentHistoryCoordinator.name,
            selection: $activeCoordinatorName,
            destination: {
                Screen { PaymentHistoryScreen(viewModel: createViewModel()) }
            },
            label: { EmptyView() }
        )
    }

    private func createViewModel() -> PaymentHistoryScreenViewModel {
        return viewModel
    }
}
