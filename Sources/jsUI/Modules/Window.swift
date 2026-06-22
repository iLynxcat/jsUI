import AppKit
import JavaScriptCore

@objc protocol WindowJSExport: JSExport {
	func makeButton() -> Button
    func activate() -> Void
    func center() -> Void
    
    func presentInfo(_ description: String, _ title: String?) -> Void
    func presentWarning(_ description: String, _ title: String?) -> Void
    func presentError(_ description: String, _ title: String?) -> Void
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
    
    private func makeAlert(info: String, title: String, style: NSAlert.Style) -> NSAlert {
        let alert = NSAlert()
        alert.messageText = title
        alert.informativeText = info
        alert.alertStyle = style
        return alert
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
    
    func presentInfo(_ description: String, _ title: String?) {
        let alert = makeAlert(info: description, title: title ?? "Heads up!", style: .informational)
        alert.beginSheetModal(for: nsWindow)
    }

    func presentWarning(_ description: String, _ title: String?) {
        let alert = makeAlert(info: description, title: title ?? "Warning!", style: .warning)
        alert.beginSheetModal(for: nsWindow)
    }
    
    func presentError(_ description: String, _ title: String?) {
        let alert = makeAlert(info: description, title: title ?? "An error occurred", style: .critical)
        alert.beginSheetModal(for: nsWindow)
    }
}
