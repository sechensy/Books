//
//  CustomTextField.swift
//  Books
//
//  Created by Ксения Панкратова on 29.07.2025.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    var title: String
    @Binding var inputText: String
    var onSubmit: (() -> Void)? = nil
    
    var body: some View {
        TextField("", text: $inputText, prompt: Text(title).foregroundColor(.black))
            .font(.custom("Roboto-ExtraLight", size: 12))
            .padding(.horizontal, 17)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.buttonGray, lineWidth: 1)
            )
            .frame(maxWidth: .infinity)
            .onSubmit {
                onSubmit?()
            }
    }
}
