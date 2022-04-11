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

struct FullScreenModalModifier<SubContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let subContent: SubContent

    init(
        isPresented: Binding<Bool>,
        @ViewBuilder subContent: () -> SubContent
    ) {
        self._isPresented = isPresented
        self.subContent = subContent()
    }

    func body(content: Content) -> some View {
        content
            .overlay {
                FullScreenModal(isPresented: $isPresented) {
                    subContent
                }.edgesIgnoringSafeArea(.all)
            }
    }
}

extension View {
    func FullScreenModal<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) -> some View {
        modifier(FullScreenModalModifier(isPresented: isPresented) {
            content()
        })
    }
}
