//
//  StayFocusedApp.swift
//  StayFocused
//
//  Created by Timofey on 5/10/2022.
//

import SwiftUI

@main
struct StayFocusedApp: App {
    var body: some Scene {
        WindowGroup {
          PlayerView(viewModel: TimerViewModel())
            .frame(height: 120)
        }
    }
}
