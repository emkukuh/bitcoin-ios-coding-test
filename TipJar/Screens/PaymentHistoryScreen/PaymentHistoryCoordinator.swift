//
//  PaymentHistoryCoordinator.swift
//  TipJar
//
//  Created by kukuh on 09/04/22.
//

import SwiftUI

struct PaymentHistoryCoordinator: View {
    @Binding var activeCoordinatorName: String?
    var body: some View {
//        NavigationView {
//            ZStack {
//                Screen { PaymentHistoryScreen(viewModel: createViewModel()) }
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        Button(action: { print("") }) {
//                            Image(R.image.history.name)
//                        }
//                    }
//            }
//        }
//        .background(Color.white)
//        .overlay(NavigationBarView())
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
        PaymentHistoryScreenViewModel()
    }
}
