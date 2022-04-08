//
//  HorizontalListItemViewModel.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Foundation

class HorizontalListItemViewModel: ObservableObject {
    var title: String = DefaultValues.string
    @Published var value: String = DefaultValues.string
}
