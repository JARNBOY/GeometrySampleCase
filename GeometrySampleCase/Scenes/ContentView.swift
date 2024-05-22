//
//  ContentView.swift
//  GeometrySampleCase
//
//  Created by Papon Supamongkonchai on 22/5/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var isShowSheetModalView = false
    @State var inputTextModal: String = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                HStack {
                    Spacer()
                    Text("Header Auume")
                    Spacer()
                }
                .frame(height: 150)
                .background(Color.yellow)
                
                // Assume Case need use ScrollView content
                ScrollView {
                    VStack(spacing: .zero) {
                        Text("Title Test Assume")
                    }
                    .background(Color.gray)
                    .frame(height: 300)
                    
                    Button(action: {
                        isShowSheetModalView.toggle()
                    }, label: {
                        Text("OPEN Modal Click Here!")
                            .foregroundStyle(Color.white)
                    })
                    
                    VStack(spacing: .zero) {
                        Text("Some Content")
                    }
                    .background(Color.gray)
                    .frame(height: 400)
                }
            }
            .background(Color.red)
            sampleModalView()
        }
        
    }
    
    @ViewBuilder
    func sampleModalView() -> some View {
        let defaultModalHeight: CGFloat = 600
        SheetCustomModalView(isOpen: $isShowSheetModalView, modalHeight: defaultModalHeight) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .padding(.all, 24)
                
                
                TextField("Enter your name", text: $inputTextModal)
                Text("Hello, \(inputTextModal)!")
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
