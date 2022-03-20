//
//  Suggestion.swift
//  DesignCodeiOS15
//
//  Created by Татьяна Мальчик on 10.03.2022.
//

import SwiftUI

struct Suggestion: Identifiable {
  let id = UUID()
  var text: String
}

var suggestions = [
  Suggestion(text: "SwiftUI"),
  Suggestion(text: "React"),
  Suggestion(text: "Design")
]
