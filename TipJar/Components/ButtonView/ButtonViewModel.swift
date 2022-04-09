//
//  ButtonViewModel.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import Foundation

class ButtonViewModel: ObservableObject {
    @Published var isHidden: Bool = false
    var title: String = DefaultValues.string
    @Published var iconName: String = DefaultValues.string
    @Published var onTapHandler: Typealiases.buttonTapHandler = { return }
}
