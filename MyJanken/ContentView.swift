//
//  ContentView.swift
//  MyJanken
//
//  Created by sherryfeng on 4/16/26.
//

import SwiftUI

struct ContentView: View {
    @State private var playerJankenNumber = 0
    @State private var npcJankenNumber = 0
    @State private var currentCount = 0 // 回戦数
    @State private var isWin = false

    private let soundPlayer = SoundPlayer()

    var body: some View {
        VStack {
            HStack {
                Text("26cm0128 封怡璇")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                if currentCount != 0 {
                    Text("第\(currentCount)回戦")
                        .font(.largeTitle)
                } else {
                    Text("開戦!")
                        .font(.largeTitle)
                }
            }
            .padding(.horizontal)
            .background(Color.bg)
            .foregroundStyle(Color.fore)
            VStack {
                JankenView(jankenNumber: npcJankenNumber)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .foregroundStyle(Color.fore)
            if currentCount != 0 {
                Divider()
                    .background(Color.fore)
                    .frame(height: 2)
            }
            ZStack {
                VStack {
                    JankenView(jankenNumber: playerJankenNumber, isComputer: false)
                }
                if isWin {
                    Image(systemName: "sparkles")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .foregroundColor(.yellow)
                        .symbolEffect(.pulse, options: .nonRepeating)
                        .onAppear {
                            soundPlayer.winPlay()
                        }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(Color.fore)

            VStack(spacing: 0) {
                // ジャンケン
                Button {
                    var newPlayerNumber = 0
                    var newComputerNumber = 0 // npc player
                    let randomIn = 1 ... 3
                    repeat {
                        newPlayerNumber = Int.random(in: randomIn)
                    } while playerJankenNumber == newPlayerNumber
                    playerJankenNumber = newPlayerNumber

                    repeat {
                        newComputerNumber = Int.random(in: randomIn)
                    } while npcJankenNumber == newComputerNumber || newPlayerNumber == newComputerNumber
                    npcJankenNumber = newComputerNumber

                    currentCount += 1

                    if (playerJankenNumber == 1 && npcJankenNumber == 2) || // 玩家出石头(1) 赢 电脑剪刀(2)
                        (playerJankenNumber == 2 && npcJankenNumber == 3) || // 玩家出剪刀(2) 赢 电脑布(3)
                        (playerJankenNumber == 3 && npcJankenNumber == 1)
                    {
                        isWin = true
                    } else {
                        isWin = false
                    }
                } label: {
                    Text("ジャンケンをする！")
                        .frame(maxWidth: .infinity)
                        .frame(height: 88)
                        .font(.title2.bold())
                        .background(Color.fore)
                }
            }.foregroundStyle(Color.white)
        }
        .background(Color.bg)
    }
}

#Preview {
    ContentView()
}
