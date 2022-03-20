//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by Татьяна Мальчик on 15.02.2022.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("selectedTab") var selectedTab: Tab = .home
  @AppStorage("showModal") var showModal = false
  @EnvironmentObject var model: Model
  
  var body: some View {
    ZStack(alignment: .bottom) {
      switch selectedTab {
      case .home:
        HomeView()
      case .explore:
        ExploreView()
      case .notifications:
        AccountView()
      case .library:
        AccountView()
      }
      
      TabBar()
        .offset(y: model.showDetail ? 200 : 0)
      
      if showModal {
        ModalView()
          .zIndex(1)
      }
    }
    .safeAreaInset(edge: .bottom, spacing: 0) {
      Color.clear.frame(height: 44)
    }
    .dynamicTypeSize(.large ... .xxLarge)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .preferredColorScheme(.light)
        .previewDevice("iPhone 13 Pro Max")
      ContentView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 13 Pro Max")
    }
    .environmentObject(Model())
  }
}
