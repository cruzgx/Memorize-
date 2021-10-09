//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Cruz Gonzalez Garcia on 8/25/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let game = EmojiMemoryGame()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
