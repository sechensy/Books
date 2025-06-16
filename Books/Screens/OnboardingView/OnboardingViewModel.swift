//
//  OnboardingViewModel.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation

final class OnboardingViewModel: OnboardingProtocol {
    private var startScreenViewModel: StartScreenViewModel?

    func setUpScreenViewModel(_ startScreenViewModel: StartScreenViewModel) {
        self.startScreenViewModel = startScreenViewModel
    }

    func didTapContinue() {
        startScreenViewModel?.updateScreenState(newScreenState: .list)
    }
}
