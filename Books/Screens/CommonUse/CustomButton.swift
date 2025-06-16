//
//  CustomButton.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    private let title: String
    private var action: (() -> Void)?

    init(_ title: String, action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button {
            action?()
        } label: {
            Text(title)
                .font(.custom("Roboto", size: 18))
        }
        .buttonStyle(GrayButtonStyle())
    }
}

// MARK: - GrayButtonStyle

private struct GrayButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .frame(height: 40)
            .background(Color.buttonGray)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - Preview

#Preview {
    CustomButton("Placeholder") {
        print("[DEBUG]: Нажали на кнопку")
    }
    .padding(.horizontal, 60)
}
