//
//  MainView.swift
//  MyJanken
//
//  Created by sherryfeng on 5/18/26.
//

import SwiftUI

struct MainView: View {
    @State private var isGameActive = false

    var body: some View {
        Group {
            if isGameActive {
                ContentView()
                    .transition(.opacity)
            } else {
                CounterView {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isGameActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
