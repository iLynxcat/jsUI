import AppKit
import JavaScriptCore

@objc protocol WindowJSExport: JSExport {
	func makeButton() -> Button
    func activate() -> Void
    func center() -> Void
    func showAlert(_ title: String, _ description: String) -> Void
}

@objc final class Window: NSObject {
	let nsWindow: NSWindow

	init(titled title: String, width: Double, height: Double) {
		nsWindow = NSWindow(
			contentRect: NSRect(
				x: 0, y: 0,
				width: width, height: height),
			styleMask: [.titled, .closable],
			backing: .buffered,
			defer: false)
		super.init()
        
        activate()
	}
}

extension Window: WindowJSExport {
    func makeButton() -> Button {
        let button = Button()
        nsWindow.contentView!.addSubview(button.nsButton)
        return button
    }
    
    func activate() {
        nsWindow.makeKeyAndOrderFront(nil)
    }
    
    func center() {
        nsWindow.center()
    }
    
    func showAlert(_ title: String, _ description: String) {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = description
        alert.alertStyle = .warning
        alert.beginSheetModal(for: nsWindow)
    }
}
