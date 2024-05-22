//
//  SheetCustomModalView.swift
//  GeometrySampleCase
//
//  Created by Papon Supamongkonchai on 22/5/2567 BE.
//

import SwiftUI

struct SheetCustomModalView<Content: View>: View {
    @Binding var isOpen: Bool
    let screen = UIScreen.main.bounds
    var modalHeight: CGFloat = 0

    var content: () -> Content
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            if isOpen {
                Spacer()
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isOpen = false
                    }
                // Foreground
                VStack {
                    Spacer()
                    ZStack {
                        Color.white.opacity(1.0)
                            .frame(width: screen.size.width, height: modalHeight)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        self.content()
                            .frame(width: screen.size.width, height: modalHeight)
                    }
                }
                .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
    }
}
