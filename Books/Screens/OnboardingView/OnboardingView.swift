//
//  OnboardingView.swift
//  Books
//
//  Created by Ксения Панкратова on 16.06.2025.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @State var viewModel: OnboardingViewModel
    @State private var title = Constants.titleButton
    @State private var selectedPage = 0
    @Environment(StartScreenViewModel.self) private var startScreenViewModel

    var body: some View {
        VStack {
            pages
            slider
            Spacer()
            buttonContainer
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.setUpScreenViewModel(startScreenViewModel)
        }
        .onChange(of: selectedPage) {
            title = (selectedPage == Constants.countSlides - 1) ? Constants.titleButtonStart : Constants.titleButton
        }
    }
}

private extension OnboardingView {
    var pages: some View {
        TabView(selection: $selectedPage) {
            SlideItem(tag: 0, imageName: "bookFirst", description: Constants.firstDescription)
            SlideItem(tag: 1, imageName: "bookSecond", description: Constants.secondDescription)
            SlideItem(tag: 2, imageName: "bookThird", description: Constants.thirdDescription)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 310)
        .padding(.top, 230)
    }

    var slider: some View {
        HStack {
            ForEach(0..<Constants.countSlides, id: \.self) { slide in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(slide == selectedPage ? .buttonGray : .selected)
                    .onTapGesture {
                        withAnimation {
                            selectedPage = slide
                        }
                    }
            }
        }
        .padding(.top, 20)
    }

    var buttonContainer: some View {
        CustomButton(title) {
            if selectedPage < Constants.countSlides - 1 {

                withAnimation {
                    selectedPage += 1
                }
            } else {
                viewModel.didTapContinue()
            }
        }
        .padding(.bottom, 160)
        .padding(.horizontal, 40)
    }
}

// MARK: - Constants

private extension OnboardingView {
    enum Constants {
        static let firstDescription = "Сохраняйте книги, которые вы уже прочитали, читаете сейчас или планируете прочесть"
        static let secondDescription = "Следите за своим книжным прогрессом и возвращайтесь к любимым историям в один клик"
        static let thirdDescription = "Создавайте персональную библиотеку и вдохновляйтесь списком своих книжных открытий"
        static let titleButton = "Продолжить"
        static let titleButtonStart = "Начать пользоваться"
        static let countSlides = 3
    }
}

// MARK: - Preview

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
        .environment(StartScreenViewModel())
}
