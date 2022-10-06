//
//  Resources.swift
//  StayFocused
//
//  Created by Timofey on 5/10/2022.
//

import Foundation

enum Resources {
  enum Colors {
    static let main: String = "main"
    enum AudioCell {
      static let slider_on_left: String = "slider_on_left"
      static let slider_on_right: String = "slider_on_right"
      static let slider_off: String = "slider_off"
      static let title_on: String = "audio_title_on"
      static let title_off: String = "audio_title_off"
    }
    enum Timer {
      static let timer_bg: String = "timer_bg"
      static let timer_clock: String = "timer_clock"
      static let timer_title: String = "timer_title"
      static let pomodoro_filled: String = "pomodoro_filled"
      static let pomodoro_unfilled: String = "pomodoro_unfilled"
      static let overall_time: String = "overall_time"
      static let overall_title: String = "overall_title"
      static let button: String = "button"
    }
  }
  enum Images {
    enum Timer {
      static let play: String = "play.fill"
      static let pause: String = "pause.fill"
    }
  }
}
