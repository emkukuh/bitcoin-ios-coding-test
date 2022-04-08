//
//  HomeCoordinator.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import SwiftUI

struct HomeCoordinator: View {
    @State var activeCoordinatorName: String?
    @State var viewModel: HomeScreenViewModel = HomeScreenViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Screen { HomeScreen(viewModel: setupViewModel()) }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button(action: showHistory) {
                            Image(R.image.history.name)
                        }
                    }
                renderNavigationLink()
            }
        }
        .background(Color.white)
        .overlay(NavigationBarView())
    }

    private func setupViewModel() -> HomeScreenViewModel {
        return viewModel
    }

    private func showHistory() {
        print("history")
        activeCoordinatorName = PaymentHistoryCoordinator.name
    }

    private func renderNavigationLink() -> some View {
        Group {
            PaymentHistoryCoordinator(activeCoordinatorName: $activeCoordinatorName)
        }
    }
}
