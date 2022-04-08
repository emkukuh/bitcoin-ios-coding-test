//
//  MainCoordinator.swift
//  TipJar
//
//  Created by kukuh on 07/04/22.
//

import SwiftUI

//struct MainCoordinator: View {
//    @State var activeCoordinatorName: String? = HomeScreenCoordinator.name
//    var body: some View {
//        NavigationView {
//            HomeScreenCoordinator(activeCoordinatorName: $activeCoordinatorName)
//        }
//    }
//
//    private func createViewModel() -> HomeScreenViewModel {
//        HomeScreenViewModel()
//    }
//}
//
//struct PaymentHistoryCoordinator: View {
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Screen { HomeScreen(viewModel: HomeScreenViewModel()) }
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        Button(action: { print("") }) {
//                            Image(R.image.history.name)
//                        }
//                    }
//            }
//        }
//        .background(Color.white)
//        .overlay(NavigationBarView())
//    }
//}
