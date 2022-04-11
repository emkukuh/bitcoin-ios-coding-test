//
//  NavigationBarView.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

struct NavigationBarView<Content: View>: View {
    @ObservedObject var viewModel = NavigationBarViewModel()
    let content: Content
    var body: some View { renderBody() }

    init(
        viewModel: NavigationBarViewModel = NavigationBarViewModel(),
        content: () -> Content
    ) {
        self.viewModel = viewModel
        self.content = content()
    }

    private func renderBackButton() -> some View {
       ButtonView(viewModel: viewModel.backButtonViewModel)
            .frame(
                width: FrameSizes.value42,
                height: FrameSizes.value42,
                alignment: .leading
            )
            .padding(.leading, Spaces.value10)
            .setHidden(
                viewModel.backButtonViewModel.iconName.isEmpty,
                isRemove: false
            )
    }

    private func renderRightButton() -> some View {
        ButtonView(viewModel: viewModel.rightButtonViewModel)
            .frame(
                width: FrameSizes.value42,
                height: FrameSizes.value42,
                alignment: .leading
            )
            .padding(.trailing, Spaces.value10)
            .setHidden(
                viewModel.rightButtonViewModel.iconName.isEmpty,
                isRemove: false
            )
    }

    private func renderCenterImage() -> some View {
        Image(R.image.tipJarLogo.name)
            .aspectRatio(contentMode: .fit)
            .setHidden(viewModel.imageString.isEmpty, isRemove: true)
    }

    private func renderNavTitle() -> some View {
        Text(viewModel.title)
            .font(Fonts.robotoMedium16)
            .setHidden(viewModel.title.isEmpty, isRemove: true)
    }

    private func renderNavbar() -> some View {
        ZStack(alignment: .center) {
            renderCenterImage()
            renderNavTitle()
            HStack {
                renderBackButton()
                Spacer()
                renderRightButton()
            }
        }.setHidden(viewModel.isHidden, isRemove: true)
    }

    private func renderBody() -> some View {
        VStack(spacing: DefaultValues.cgFloat) {
            renderNavbar()
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NavigationBarView {
                HomeScreen(viewModel: HomeScreenViewModel())
            }
            Spacer()
        }
    }
}
