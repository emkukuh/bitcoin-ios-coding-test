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

    init(
        viewModel: HorizontalListItemViewModel,
        style: HorizontalListItemViewStyle
    ) {
        self.viewModel = viewModel
        self.style = style
    }

    private func renderTitle() -> some View {
        Text(viewModel.title)
            .font(style.titleFont)
    }

    private func renderValue() -> some View {
        Text(viewModel.value)
            .font(style.valueFont)
    }

    private func renderBody() -> some View {
        HStack {
            renderTitle()
            Spacer()
            renderValue()
        }
    }
}
