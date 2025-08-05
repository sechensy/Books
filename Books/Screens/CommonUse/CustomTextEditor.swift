//
//  CustomTextEditor.swift
//  Books
//
//  Created by Ксения Панкратова on 31.07.2025.
//

import Foundation
import SwiftUI

struct CustomTextEditor: View {
    var title: String
    @Binding var inputText: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if inputText.isEmpty {
                Text(title)
                    .foregroundColor(.black)
                    .font(.custom("Roboto-ExtraLight", size: 12))
                    .padding(.horizontal, 17)
                    .padding(.vertical, 15)
            }
            
            TextEditor(text: $inputText)
                .font(.custom("Roboto-ExtraLight", size: 12))
                .padding(.horizontal, 13)
                .padding(.vertical, 8)
                .background(Color.clear)
                .scrollContentBackground(.hidden)
        }
        .frame(height: 180)
        .background(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.buttonGray, lineWidth: 1)
        )
        .frame(maxWidth: .infinity)
    }
}
