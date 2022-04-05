//
//  StepperViewModel.swift
//  TipJar
//
//  Created by kukuh on 06/04/22.
//

import Combine

class StepperViewModel: ObservableObject {
    @Published var value: Int = 1
    private var anyCancellable = Set<AnyCancellable>()

    func increaseValue() {
        value = value + 1
    }

    func decreaseValue() {
        if value <= 1 { return }
        value = value - 1
    }
}
