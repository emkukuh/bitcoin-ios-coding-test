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
            Color.blue
                .background(.ultraThinMaterial)
            Text("title")
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
