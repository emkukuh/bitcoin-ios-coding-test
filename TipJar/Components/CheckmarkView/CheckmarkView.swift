//
//  CheckmarkView.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

struct CheckmarkView: View {
    @ObservedObject var viewModel = CheckmarkViewModel()
    var body: some View { renderBody() }

    init(viewModel: CheckmarkViewModel) {
        self.viewModel = viewModel
    }

    private func renderCheckmark() -> some View {
        let imageName = viewModel.isChecked
            ? R.image.checkSelected.name
            : R.image.checkUnselected.name
        let borderColor = viewModel.isChecked
        ? Colors.Orange.main
        : Colors.Gray.light
        return Image(imageName)
            .padding()
            .clipShape(
                RoundedRectangle(cornerRadius: CornerRadiuses.value6)
            )
            .frame(
                width: FrameSizes.value30,
                height: FrameSizes.value30
            )
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadiuses.value12)
                    .stroke(
                        borderColor,
                        lineWidth: 1
                    )
            )
    }

    private func renderLabel() -> some View {
        Text(viewModel.label)
            .foregroundColor(.black)
            .font(Fonts.robotoMedium16)
    }

    private func renderBody() -> some View {
        Button(action: viewModel.handleChangeValue) {
            HStack(spacing: Spaces.value16) {
                renderCheckmark()
                renderLabel()
            }
        }
    }
}

struct CheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        CheckmarkView(viewModel: CheckmarkViewModel())
    }
}
