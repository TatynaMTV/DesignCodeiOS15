//
//  AvatarView.swift
//  DesignCodeiOS15
//
//  Created by Татьяна Мальчик on 20.03.2022.
//

import SwiftUI

struct AvatarView: View {
  @AppStorage("isLogged") var isLogged = false
  
  var body: some View {
    Group {
      if isLogged {
        AsyncImage(url: URL(string: "https://mobimg.b-cdn.net/v3/fetch/b8/b89e89af4f740c3e4e9fbd535cf41e4f.jpeg"), transaction: Transaction(animation: .easeOut)) { phase in
          switch phase {
          case .success(let image):
            image.resizable()
              .transition(.scale(scale: 0.5, anchor: .center))
          case .empty:
            ProgressView()
          case .failure(_):
            Color.gray
          @unknown default:
            EmptyView()
          }
        }
      } else {
        Image("Avatar Default")
          .resizable()
      }
    }
    .frame(width: 26, height: 26)
    .cornerRadius(10)
    .padding(8)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    .strokeStyle(cornerRadius: 18)
  }
}

struct AvatarView_Previews: PreviewProvider {
  static var previews: some View {
    AvatarView()
  }
}
