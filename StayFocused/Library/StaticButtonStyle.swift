//
//  StaticButtonStyle.swift
//  StayFocused
//
//  Created by Timofey on 6/10/2022.
//

import Foundation
import SwiftUI

struct StaticButtonStyle: ButtonStyle {
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
  }
  
}
