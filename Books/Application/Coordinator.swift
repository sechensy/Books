//
//  Coordinator.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation
import SwiftUI
import Observation

protocol CoordinatorProtocol {
    var navPath: NavigationPath { get set }

    /// Переход на конкретный экран
    func addScreen(screen: BookListScreens)
    /// Открыть предыдущий экран
    func openPreviousScreen()
    /// Сбросить навигацию в корень
    func goToRoot()
}

@Observable
final class Coordinator: CoordinatorProtocol {
    var navPath = NavigationPath()
}

extension Coordinator {
    
    func addScreen<T: Hashable>(screen: T) {
        navPath.append(screen)
    }
    
    func openPreviousScreen() {
        guard navPath.count - 1 >= 0 else { return }
        navPath.removeLast()
    }
    
    func goToRoot() {
        while navPath.count > 0 {
            navPath.removeLast()
        }
    }
}
