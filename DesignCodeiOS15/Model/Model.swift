//
//  Model.swift
//  DesignCodeiOS15
//
//  Created by Татьяна Мальчик on 24.02.2022.
//

import SwiftUI
import Combine

class Model: ObservableObject {
  @Published var showDetail: Bool = false
  @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
  case signUp
  case signIn
}
