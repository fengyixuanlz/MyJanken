//
//  CounterView.swift
//  MyJanken
//
//  Created by sherryfeng on 5/18/26.
//

import SwiftUI

struct CounterView: View {
    @State private var timerHandler: Timer?
    @State private var count = 0
    @State private var timerValue = 3
    
    private let soundPlayer = SoundPlayer()
    var onFinished:() -> Void
    
    var body: some View {
        ZStack {
            if(timerValue - count == 0){
                Text("START!")
                    .font(.system(size: 88, weight: .semibold, design: .serif))
                    .underline()
            } else {
                Text("\(timerValue - count)")
                    .font(.system(size: 340, weight: .semibold, design: .serif))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
        .foregroundStyle(Color.fore)
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    func countDownTimer() {
        count += 1
        if timerValue - count <= 0 {
            stopTimer()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                onFinished()
            }
        }
    }
    
    func startTimer() {
        if let timerHandler, timerHandler.isValid == true {
            return
        }
        
        if timerValue - count <= 0 {
            count = 0
        }
        
        soundPlayer.countdownPlay()
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            Task {
                @MainActor in
                countDownTimer()
            }
        })
    }

    func stopTimer() {
        timerHandler?.invalidate()
        timerHandler = nil
    }
}

#Preview("CountdownView") {
    CounterView {
        print("over")
    }
}
