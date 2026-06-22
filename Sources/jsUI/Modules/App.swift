import AppKit
import JavaScriptCore

@objc protocol AppJSExport: JSExport {
	static func makeWindow(_ title: String, _ width: Double, _ height: Double) -> Window
	static func run()
}

@objc final class App: NSObject, JSModule {
	static func install(in context: JSContext) {
		context.setObject(App.self, forKeyedSubscript: "App" as NSString)
	}
}

extension App: AppJSExport {

	static func run() {
		let app = NSApplication.shared
        
        app.setActivationPolicy(.regular)
		app.activate()
        
		app.run()
	}

	static func makeWindow(_ title: String, _ width: Double, _ height: Double) -> Window {
		Window(titled: title, width: width, height: height)
	}

}
