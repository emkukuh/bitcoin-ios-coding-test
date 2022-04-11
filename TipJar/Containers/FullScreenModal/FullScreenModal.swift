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
            Color.black.opacity(0.3)
            content
        }
        .edgesIgnoringSafeArea(.all)
        .setHidden(!isPresented, isRemove: true)
        
    }
}
