//
//  AppDelegate.swift
//  CursorHighlighter
//
//  Created by Zhou Yang on 2023/3/22.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    public static var enabled = true
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown]) { (event) in
            switch event.type {
            case .leftMouseDown: self.leftMouseDown(event: event)
            default: break;
            }
        }
    }
    
    func leftMouseDown(event: NSEvent) {
        if !Self.enabled {
            return
        }
        let position = CGPoint(x: NSEvent.mouseLocation.x - 40, y: NSEvent.mouseLocation.y - 40)
        let controller = CircleWrapperController(rootView: CircleView(), size: CGSize(width: 80, height: 80))
        
        controller.window?.setFrameOrigin(position)
        controller.showWindow(nil)
    }
}
