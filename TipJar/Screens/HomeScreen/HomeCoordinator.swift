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
                renderNavigationLink()
            }
        }
    }

    private func setupViewModel() -> HomeScreenViewModel {
        let viewModel = HomeScreenViewModel()
        viewModel.navigationViewModel.backButtonViewModel.isHidden = true
        viewModel.navigationViewModel.rightButtonViewModel.iconName = R.image.history.name
        viewModel.navigationViewModel.rightButtonViewModel.onTapHandler = { self.showHistory() }
        viewModel.navigationViewModel.imageString = R.image.tipJarLogo.name
        return viewModel
    }

    private func showHistory() {
        activeCoordinatorName = PaymentHistoryCoordinator.name
    }

    private func renderNavigationLink() -> some View {
        Group {
            PaymentHistoryCoordinator(activeCoordinatorName: $activeCoordinatorName)
        }
    }
}
