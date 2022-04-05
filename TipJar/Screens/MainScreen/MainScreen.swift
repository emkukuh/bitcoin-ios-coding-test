//
//  MainScreen.swift
//  TipJar
//
//  Created by Jumpei Katayama on 2022/02/11.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var viewModel = MainScreenViewModel()
    var body: some View { renderBody() }

    private func renderField() -> some View {
        AmountInputView(viewModel: viewModel.amountInputViewModel)
    }

    private func renderBody() -> some View {
        VStack {
            renderField()
            Button(action: viewModel.buttonTap) {
                Text("tap")
            }
            Spacer()
        }
        .padding([.leading, .trailing], Spaces.value24)
        .padding(.top, Spaces.value16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
