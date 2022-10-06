//
//  AudioCell.swift
//  StayFocused
//
//  Created by Timofey on 5/10/2022.
//

import Foundation
import SwiftUI

struct AudioCell: View {
  @Binding var viewData: AudioCellViewData
  
  var body: some View {
    ZStack {
      HStack(alignment: .center, spacing: 20) {
        AudioCellImageButton(
          imageName: "flame.fill",
          isOn: $viewData.parametr.isOn
        )
        VStack(alignment: .leading, spacing: 5) {
          AudioCellTextButton(
            text: viewData.audioTitle,
            isOn: $viewData.parametr.isOn
          )
          Slider(
            value: $viewData.parametr.volume,
            in: Float(0)...Float(1)
          )
          .tint(
            Color(
              viewData.parametr.isOn ? Resources.Colors.AudioCell.slider_on_left : Resources.Colors.AudioCell.slider_off
            )
          )
        }
      }
    }
  }
}


struct AudioCellImageButton: View {
  let imageName: String
  @Binding var isOn: Bool
  
  var body: some View {
    Button {
      isOn.toggle()
    } label: {
      Image(systemName: imageName)
        .resizable()
        .renderingMode(.original)
        .frame(width: 25, height: 30)
        .aspectRatio(contentMode: .fit)
        .foregroundColor(Color(
          isOn ? Resources.Colors.AudioCell.title_on : Resources.Colors.AudioCell.title_off
        ))
    }
  }
}

struct AudioCellTextButton: View {
  let text: String
  @Binding var isOn: Bool
  
  var body: some View {
    Button {
      isOn.toggle()
    } label: {
      Text(text)
        .multilineTextAlignment(.leading)
        .fontWeight(.bold)
        .foregroundColor(
          Color(isOn ? Resources.Colors.AudioCell.title_on : Resources.Colors.AudioCell.title_off)
        )
    }
  }
}
