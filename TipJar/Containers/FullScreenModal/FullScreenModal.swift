//
//  FullScreenModal.swift
//  TipJar
//
//  Created by kukuh on 10/04/22.
//

import SwiftUI

struct FullScreenModal<Content: View>: View {
    @Binding var isPresented: Bool
    @ViewBuilder let content: Content
    var body: some View { renderBody() }

    private func renderBody() -> some View {
        ZStack {
            Color.yellow.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            content
//                .frame(width: FrameSizes.screenWidth, height: FrameSizes.screenHeight)
        }.setHidden(!isPresented, isRemove: true)
    }
}
