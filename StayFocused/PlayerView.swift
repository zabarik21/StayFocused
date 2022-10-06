//
//  PlayerView.swift
//  StayFocused
//
//  Created by Timofey on 6/10/2022.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
  
  @Published var overallTimeString = "3 ч 57 минут"
  @Published var isActive = false
  @Published var timerText: String = "25:00"
  @Published var timerFinished = false
  @Published var pomodoroCount = 0
  @Published var minutes: Int = 25 {
    didSet {
      self.timerText = "\(minutes):00"
    }
  }
  
  private var initialTime = 0
  private var endDate = Date()
  
  func start(minutes: Int) {
    self.initialTime = minutes
    self.endDate = Date()
    self.isActive = true
    self.endDate = Calendar.current.date(byAdding: .minute, value: minutes, to: endDate)!
  }
  
  func reset() {
    self.minutes = initialTime
    self.isActive = false
    self.timerText = "\(minutes):00"
  }
  
  func updateCountDown() {
    guard isActive else { return }
    let now = Date()
    let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
    if diff <= 0 {
      self.isActive = false
      self.timerText = "0:00"
      
    }
  }
}

struct PlayerView: View {
  
  @ObservedObject var viewModel: TimerViewModel
  
  var body: some View {
    ZStack {
      Color(Resources.Colors.Timer.timer_bg)
      HStack(spacing: 0) {
        
        VStack(alignment: .trailing) {
          PomodoroCountView(count: $viewModel.pomodoroCount)
          Spacer()
          TimerView(
            timerText: $viewModel.timerText,
            overallTimeText: $viewModel.overallTimeString
          )
        }
        .padding(12)
        
        Button {
          viewModel.isActive.toggle()
        } label: {
          ZStack {
            Color(Resources.Colors.Timer.button)
            Image(systemName:
                !viewModel.isActive ?
                Resources.Images.Timer.play :
                Resources.Images.Timer.pause
              )
            .imageScale(.large)
            .font(.system(size: 55))
            .foregroundColor(Color(
              Resources.Colors.Timer.timer_clock
            ))
          }
          .frame(minWidth: 0, maxWidth: .infinity)
          .aspectRatio(1, contentMode: .fit)
        }
        .buttonStyle(StaticButtonStyle())
      }
    }
  }
}



struct PomodoroCountView: View {
  
  @Binding var count: Int
  
  var body: some View {
    HStack(spacing: 5) {
      ForEach(0..<4) { index in
        Circle()
          .foregroundColor(
            Color(
              index < count ? Resources.Colors.Timer.pomodoro_filled : Resources.Colors.Timer.pomodoro_unfilled
            )
          )
          .frame(width: 10, height: 10)
      }
      Spacer()
        .frame(width: 15)
      ForEach(4..<8) { index in
        Circle()
          .foregroundColor(
            Color(
              index < count ? Resources.Colors.Timer.pomodoro_filled : Resources.Colors.Timer.pomodoro_unfilled
            )
          )
          .frame(width: 10, height: 10)
      }
    }
  }
  
}

struct TimerView: View {
  
  @Binding var timerText: String
  @Binding var overallTimeText: String
  
  var body: some View {
    ZStack {
      HStack(alignment: .bottom) {
        VStack(spacing: -7) {
          Text("Время фокусировки")
            .font(.custom(
              "Futura",
              size: 11)
            )
            .fontWeight(.medium)
            .foregroundColor(Color(Resources.Colors.Timer.timer_title))
          Text(timerText)
            .font(.custom(
              "Futura",
              size: 41)
            )
            .bold()
            .foregroundColor(Color(Resources.Colors.Timer.timer_clock))
            .padding(.bottom, -10)
        }
        Spacer()
        VStack(alignment: .trailing) {
          Text("Cегодня")
            .multilineTextAlignment(.trailing)
            .font(.custom(
              "SF Pro Text",
              size: 12)
            )
            .textCase(.uppercase)
            .foregroundColor(
              Color(
                Resources.Colors.Timer.overall_title
              )
            )
          Text(overallTimeText)
            .font(.custom(
              "SF Pro Text",
              size: 14)
            )
            .foregroundColor(
              Color(
                Resources.Colors.Timer.overall_time
              )
            )
        }
      }
    }
  }
  
}

struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerView(viewModel: TimerViewModel())
      .frame(height: 120)
  }
}
