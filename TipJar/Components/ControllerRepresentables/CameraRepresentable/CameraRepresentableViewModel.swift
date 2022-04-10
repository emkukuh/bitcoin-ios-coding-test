//
//  CameraRepresentableViewModel.swift
//  TipJar
//
//  Created by kukuh on 11/04/22.
//

import Foundation

class CameraRepresentableViewModel: ObservableObject {
    var onCancelHandler: Typealiases.buttonTapHandler = { return }
    var onSuccessHandler: Typealiases.imageValueHandler = { _ in return }
}
