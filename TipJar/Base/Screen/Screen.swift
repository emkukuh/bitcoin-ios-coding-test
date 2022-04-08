//
//  Screen.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

struct Screen<Content: ScreenContent>: View {
    private let screenContent: Content
    var body: some View { renderBody() }

    init(_ screenContent: () -> Content) {
        self.screenContent = screenContent()
    }

    private func renderBody() -> some View {
        screenContent
    }
}
