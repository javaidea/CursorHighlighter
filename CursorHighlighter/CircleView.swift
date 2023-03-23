//
//  CircleView.swift
//  CursorHighlighter
//
//  Created by Zhou Yang on 2023/3/22.
//

import SwiftUI

struct CircleView: View {
    @State var size: CGFloat = 10
    @State var opacity: CGFloat = 1
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 5)
            .frame(width: size, height: size)
            .foregroundColor(Color(red: 0, green: 1, blue: 0.8))
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    size = 80
                }
                withAnimation(.linear(duration: 0.25).delay(0.25)) {
                    opacity = 0
                }
            }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}

class CircleWrapperController<RootView: View>: NSWindowController {
    convenience init(rootView: RootView, size: CGSize) {
        let controller = NSHostingController(rootView: rootView.frame(width: size.width, height: size.height))
        let window = NSWindow(contentViewController: controller)
        window.setContentSize(NSSize(width: size.width, height: size.height))
        window.styleMask = [.borderless]
        window.backgroundColor = .clear
        window.level = .screenSaver
        window.hasShadow = false
        self.init(window: window)
    }
    
    override func showWindow(_ sender: Any?) {
        super.showWindow(sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.close()
        }
    }
}
