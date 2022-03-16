//
//  DesignCodeiOS15App.swift
//  DesignCodeiOS15
//
//  Created by Татьяна Мальчик on 15.02.2022.
//

import SwiftUI

@main
struct DesignCodeiOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
