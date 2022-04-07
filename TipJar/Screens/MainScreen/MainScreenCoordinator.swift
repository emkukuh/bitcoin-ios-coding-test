//
//  MainScreenCoordinator.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

struct MainScreenCoordinator: View {
    var body: some View {
        NavigationView {
            Screen { MainScreen(viewModel: createViewModel()) }
                .navigationTitle(Text("NAVBAR"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func createViewModel() -> MainScreenViewModel {
        MainScreenViewModel()
    }
}
