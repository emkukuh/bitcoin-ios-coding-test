//
//  CameraCoordinator.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import SwiftUI

struct CameraCoordinator: View {
    @Binding var activeCoordinatorName: String?
    @Binding var imageBase64: String
    var body: some View {
        NavigationLink(
            tag: CameraCoordinator.name,
            selection: $activeCoordinatorName,
            destination: {
                Screen { CameraScreen(viewModel: setupViewModel()) }
            },
            label: { EmptyView() }
        )
    }

    private func setupViewModel() -> CameraScreenViewModel {
        let viewModel = CameraScreenViewModel()
        viewModel.navigationViewModel.isHidden = true
        viewModel.cameraRepresentableViewModel.onCancelHandler = {
            imageBase64 = DefaultValues.string
            viewModel.backToPreviousScreen()
        }
        viewModel.cameraRepresentableViewModel.onReceiveBase64Imagehandler = { imageBase64 in
            self.imageBase64 = imageBase64
            viewModel.backToPreviousScreen()
        }
        return viewModel
    }
}
