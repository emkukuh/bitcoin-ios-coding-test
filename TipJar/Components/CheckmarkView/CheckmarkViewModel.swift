//
//  CheckmarkViewModel.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import Foundation

class CheckmarkViewModel: ObservableObject {
    @Published var isChecked: Bool = false
    var label: String = R.string.button.takeRecieptPhoto()
    
}
