//
//  aulaGeminiApp.swift
//  aulaGemini
//
//  Created by Turma02-14 on 04/09/26.
//

import SwiftUI
import Firebase

@main
struct aulaGeminiApp: App {
    init() {
        let provider = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(provider)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
