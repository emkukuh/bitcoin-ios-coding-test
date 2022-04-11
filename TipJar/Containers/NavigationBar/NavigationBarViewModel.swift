//
//  NavigationBarViewModel.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import SwiftUI

class NavigationBarViewModel: ObservableObject {
    @Published var isHidden: Bool = false
    @Published var rightButtonViewModel = ButtonViewModel()
    @Published var backButtonViewModel = ButtonViewModel()
    var title: String = DefaultValues.string
    var imageString: String = DefaultValues.string
}
