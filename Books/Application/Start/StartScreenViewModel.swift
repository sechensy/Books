//
//  StartScreenViewModel.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation
import UIKit

@Observable
final class StartScreenViewModel {
    private(set) var currentScreenState: StartScreenState = .onboarding

    init() {
        loadScreenState()
    }

    func updateScreenState(newScreenState: StartScreenState) {
        currentScreenState = newScreenState
        UserDefaults.standard.set(newScreenState.rawValue, forKey: "savedScreenState")
    }

    func loadScreenState() {
        if let savedStateRaw = UserDefaults.standard.string(forKey: "savedScreenState"),
           let startState = StartScreenState(rawValue: savedStateRaw) {
            currentScreenState = startState
        } else {
            currentScreenState = .onboarding
        }
    }
}
