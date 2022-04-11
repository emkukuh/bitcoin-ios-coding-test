//
//  CameraRepresentableViewModel.swift
//  TipJar
//
//  Created by kukuh on 11/04/22.
//

import Foundation

class CameraRepresentableViewModel: ObservableObject {
    var onCancelHandler: Typealiases.buttonTapHandler = { return }
    var onReceiveBase64Imagehandler: Typealiases.base64ValueHandler = { _ in return }
}
