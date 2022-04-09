//
//  NavigationBarViewModel.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import SwiftUI

class NavigationBarViewModel: ObservableObject {
    @Environment(\.presentationMode) var presentationMode
    var title: String = DefaultValues.string
    var imageString: String = DefaultValues.string
    @Published var rightButtonViewModel = ButtonViewModel()
    @Published var backButtonViewModel = ButtonViewModel()

    init() {
        backButtonViewModel.iconName = R.image.back.name
        backButtonViewModel.onTapHandler = {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
