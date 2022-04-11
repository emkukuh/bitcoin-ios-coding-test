//
//  CameraScreen.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import UIKit
import SwiftUI

struct CameraScreen: ScreenContent {
    @ObservedObject var viewModel: CameraScreenViewModel
    var body: some View {
        ZStack {
            CameraRepresentable(viewModel: viewModel.cameraRepresentableViewModel)
        }.edgesIgnoringSafeArea(.all)
    }
}

