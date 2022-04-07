//
//  StepperView.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import SwiftUI

struct StepperView: View {
    @ObservedObject var viewModel = StepperViewModel()
    var body: some View { renderBody() }

    init(viewModel: StepperViewModel) {
        self.viewModel = viewModel
    }

    private func renderTitle() -> some View {
        Text(R.string.title.howManyPeople())
            .font(Fonts.robotoMedium16)
    }

    private func renderButton(
        imageName: String,
        tapHandler: @escaping () -> Void
    ) -> some View {
        Button(action: tapHandler) {
            Image(imageName)
                .padding()
                .frame(width: FrameSize.value70, height: FrameSize.value70)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(
                        Colors.Gray.lightest,
                        lineWidth: 1
                    )
                )
        }.clipped()
    }

    private func renderValue() -> some View {
        Text(viewModel.value.stringValue)
            .font(Fonts.robotoMedium42)
    }

    private func renderBody() -> some View {
        VStack(alignment: .leading, spacing: Spaces.value16) {
            renderTitle()
            HStack {
                renderButton(
                    imageName: R.image.plus.name,
                    tapHandler: viewModel.increaseValue
                )
                Spacer()
                renderValue()
                Spacer()
                renderButton(
                    imageName: R.image.minus.name,
                    tapHandler: viewModel.decreaseValue
                )
            }
        }
    }
}
