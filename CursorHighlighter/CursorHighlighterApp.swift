//
//  CursorHighlighterApp.swift
//  CursorHighlighter
//
//  Created by Zhou Yang on 2023/3/22.
//

import SwiftUI

extension Binding {
    func didSet(exec: @escaping (Value) -> Void) -> Binding {
        return Binding {
            self.wrappedValue
        } set: {
            self.wrappedValue = $0
            exec($0)
        }
    }
}

@main
struct CursorHighlighterApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State var enabled: Bool = true
    
    var body: some Scene {
        Settings {
            ContentView()
        }
        
        MenuBarExtra {
            
            Toggle("Enabled", isOn: $enabled.didSet(exec: { newValue in
                AppDelegate.enabled = newValue
            }))
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        } label: {
            Image(enabled ? "Pointer" : "PointerOff")
        }
    }
}
