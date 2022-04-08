//
//  ButtonViewModel.swift
//  TipJar
//
//  Created by kukuh on 08/04/22.
//

import Foundation

class ButtonViewModel: ObservableObject {
    var title: String = DefaultValues.string
    var onTapHandler: Typealiases.buttonTapHandler = { return }
}
