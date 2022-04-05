//
//  View+Hidden.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import SwiftUI

extension View {
    @ViewBuilder func setHidden(_ isHidden: Bool, isRemove: Bool) -> some View {
        if isHidden {
            if !isRemove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
