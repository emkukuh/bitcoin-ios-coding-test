//
//  HorizontalListItemView.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import SwiftUI

struct HorizontalListItemView: View {
    @ObservedObject var viewModel = HorizontalListItemViewModel()
    var style: HorizontalListItemViewStyle = SmallHorizontalListItemViewStyle()
    var body: some View { renderBody() }

    init(viewModel: HorizontalListItemViewModel) {
        self.viewModel = viewModel
    }

    private func renderTitle() -> some View {
        Text(viewModel.title)
            .font(Fonts.robotoMedium16)
    }

    private func renderValue() -> some View {
        Text(viewModel.value)
            .font(Fonts.robotoMedium16)
    }

    private func renderBody() -> some View {
        HStack {
            renderTitle()
            Spacer()
            renderValue()
        }
    }
}

struct HorizontalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalListItemView(viewModel: HorizontalListItemViewModel())
    }
}
