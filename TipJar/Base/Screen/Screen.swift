//
//  Screen.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

struct Screen<Content: ScreenContent>: View {
    @Environment(\.presentationMode) var presentationMode
    private let screenContent: Content
    @ObservedObject var viewModel: ScreenViewModel
    var body: some View { renderBody() }

    init(@ViewBuilder _ screenContent: () -> Content) {
        self.screenContent = screenContent()
        self.viewModel = self.screenContent.viewModel
    }

    private func renderBody() -> some View {
        NavigationBarView(viewModel: viewModel.navigationViewModel) {
            screenContent
                .navigationBarHidden(true)
        }.onAppear {
            viewModel.onBackHandler = {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
