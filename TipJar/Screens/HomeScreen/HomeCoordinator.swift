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
        viewModel.navigationViewModel.backButtonViewModel.isHidden = true
        viewModel.navigationViewModel.rightButtonViewModel.iconName = R.image.history.name
        viewModel.navigationViewModel.rightButtonViewModel.onTapHandler = {
            self.openPaymentHistoryCoordinator()
        }
        viewModel.navigationViewModel.imageString = R.image.tipJarLogo.name
        viewModel.takeRecieptPicCheckmarkViewModel.onValueChange = { isChecked in
            if isChecked {
                self.openCameraCoordinator()
                return
            }
            viewModel.recieptImageBase64 = DefaultValues.string
        }
        return viewModel
    }

    private func openPaymentHistoryCoordinator() {
        activeCoordinatorName = PaymentHistoryCoordinator.name
    }

    private func openCameraCoordinator() {
        activeCoordinatorName = CameraCoordinator.name
    }

    private func renderNavigationLink() -> some View {
        Group {
            PaymentHistoryCoordinator(activeCoordinatorName: $activeCoordinatorName)
            CameraCoordinator(
                activeCoordinatorName: $activeCoordinatorName,
                imageBase64: $viewModel.recieptImageBase64
            )
        }
    }
}
