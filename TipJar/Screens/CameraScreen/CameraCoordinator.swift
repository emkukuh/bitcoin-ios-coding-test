//
//  CameraCoordinator.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import SwiftUI

struct CameraCoordinator: View {
    @Binding var activeCoordinatorName: String?
    var body: some View {
        NavigationLink(
            tag: CameraCoordinator.name,
            selection: $activeCoordinatorName,
            destination: {
                Screen { CameraScreen(viewModel: CameraScreenViewModel()) }
            },
            label: { EmptyView() }
        )
    }
}
