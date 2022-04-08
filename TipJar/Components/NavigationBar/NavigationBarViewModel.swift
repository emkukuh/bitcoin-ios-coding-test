//
//  NavigationBarViewModel.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import Foundation

class NavigationBarViewModel: ObservableObject {
    var title: String = DefaultValues.string
    var imageString: String = DefaultValues.string
    var rightButtonViewModel = ButtonViewModel()
}
