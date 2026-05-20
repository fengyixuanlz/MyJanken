//
//  HandView.swift
//  MyJanken
//
//  Created by sherryfeng on 5/18/26.
//

import SwiftUI

struct HandView: View {
    let image: Image
    let title: Text

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .padding()
        Spacer()
        title
            .padding(.bottom)
    }
}

#Preview {
    HandView(image: Image(.choki), title: Text("チョキ"))
}
