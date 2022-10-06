//
//  ContentView.swift
//  StayFocused
//
//  Created by Timofey on 5/10/2022.
//

// State, Binding, OBserved, Published, Envieroment

import SwiftUI

class MainViewModel: ObservableObject {
  
  @Published var viewData: [AudioCellViewData] = []
  
  func fetchViewData() {
    viewData = [
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
      AudioCellViewData(
        imageSystemName: "flame.fill",
        audioTitle: "Лесная поляна",
        parametr: AudioParametr(
          volume: Float.random(in: 0...1),
          isOn: .random()
        )
      ),
    ]
  }
}


struct ContentView: View {
  
  @ObservedObject var viewModel: MainViewModel
  
  var body: some View {
    ZStack {
      Color(Resources.Colors.main)
        .ignoresSafeArea()
      ScrollView {
        LazyVStack(spacing: 20) {
          ForEach($viewModel.viewData) { viewData in
            AudioCell(
              viewData: viewData
            )
            .frame(height: 60)
          } 
        }
      }
      .padding(.horizontal, 30)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          self.viewModel.fetchViewData()
        }
      }
    }
  }
}

class Wrapper {
  let id = UUID().uuidString
}

struct AudioCellViewData: Identifiable {
  var id: String = UUID().uuidString
  let imageSystemName: String
  let audioTitle: String
  var parametr: AudioParametr
}

struct AudioParametr {
  var volume: Float
  var isOn: Bool
}





struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(viewModel: MainViewModel())
  }
}
