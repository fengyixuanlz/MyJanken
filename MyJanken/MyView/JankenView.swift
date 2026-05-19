//
//  PlayerView.swift
//  MyJanken
//
//  Created by sherryfeng on 5/18/26.
//

import SwiftUI

struct JankenView: View {
    let jankenNumber: Int
    var isComputer: Bool = true

    var body: some View {
        Group {
            // じゃんけんの数字がゼロだったら
            if jankenNumber == 0 {
                if !isComputer {
                    Text("これからじゃんけんをしましょう")
                        .padding(.bottom)
                }
            } else if jankenNumber == 1 {
                HandView(image:
                    Image(.gu), title: isComputer ? Text("\(Image(systemName: "desktopcomputer"))グー") : Text("グー"))
            } else if jankenNumber == 2 {
                HandView(image: Image(.choki), title: isComputer ? Text("\(Image(systemName: "desktopcomputer"))チョキ") : Text(" チョキ"))
            } else {
                HandView(image: Image(.pa), title: isComputer ? Text("\(Image(systemName: "desktopcomputer"))バー") : Text("バー"))
            }
        }
    }
}

#Preview {
    JankenView(jankenNumber: 1)
}
