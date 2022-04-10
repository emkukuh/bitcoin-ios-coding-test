//
//  CameraScreen.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import UIKit
import SwiftUI

class CameraScreenViewModel: ScreenViewModel {}

struct CameraScreen: ScreenContent {
    @ObservedObject var viewModel: CameraScreenViewModel
    var body: some View {
        CameraRepresentable()
    }
}

