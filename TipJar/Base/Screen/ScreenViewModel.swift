//
//  ScreenViewModel.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI
class ScreenViewModel: ObservableObject {
    @Published var navigationViewModel = NavigationBarViewModel()
    var onBackHandler: Typealiases.buttonTapHandler = { return }

    init() {
        navigationViewModel.backButtonViewModel.iconName = R.image.back.name
        navigationViewModel.backButtonViewModel.onTapHandler = { self.onBackHandler() }
    }

    func backToPreviousScreen() {
        onBackHandler()
    }
}
