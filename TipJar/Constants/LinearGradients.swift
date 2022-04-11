//
//  LinearGradients.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import SwiftUI

struct LinearGradients {
    static let clear = LinearGradient(
        colors: [],
        startPoint: .top,
        endPoint: .bottom
    )
    struct Orange {
        static let vertical = LinearGradient(
            colors: [
                Color.init(red: 242/255, green: 122/255, blue: 10/255),
                Color.init(red: 210/255, green: 110/255, blue: 17/255)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
