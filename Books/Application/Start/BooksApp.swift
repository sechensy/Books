//
//  BooksApp.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import SwiftUI

@main
struct BooksApp: App {
    @State private var viewModel = StartScreenViewModel()
    var body: some Scene {
        WindowGroup {
            startScreen
                .environment(viewModel)
        }
    }
}

private extension BooksApp {
    @ViewBuilder
    var startScreen: some View {
        switch viewModel.currentScreenState {
        case .onboarding:
            OnboardingView(viewModel: OnboardingViewModel())
        case .list:
            BookListView(viewModel: BookListViewModel())
        }
    }
}
