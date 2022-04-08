//
//  NavigationBarView.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View { renderBody() }

    private func renderBody() -> some View {
        ZStack {
            VStack {
                Image(R.image.tipJarLogo.name)
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .center)
                    .padding(.top, Spaces.value10)
            }
        }
        .frame(height: FrameSizes.value42)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, Spaces.value100)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
