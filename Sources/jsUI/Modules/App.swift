import AppKit
import JavaScriptCore

@objc protocol AppJSExport: JSExport {
    static func makeWindow(_ title: String, _ width: Double, _ height: Double)
        -> Window
    static func run()

    static var quitsWhenAllWindowsClosed: Bool { get set }
}

@objc final class App: NSObject, JSModule {

    static var main = App()

    var quitsWhenAllWindowsClosed: Bool = false

    static func install(in context: JSContext) {
        context.setObject(App.self, forKeyedSubscript: "App" as NSString)
    }

}

extension App: AppJSExport {

    static var quitsWhenAllWindowsClosed: Bool {
        get { App.main.quitsWhenAllWindowsClosed }
        set { App.main.quitsWhenAllWindowsClosed = newValue }
    }

    static func run() {
        let app = NSApplication.shared

        app.delegate = App.main
        app.setActivationPolicy(.regular)
        app.activate()

        app.run()
    }

    static func makeWindow(_ title: String, _ width: Double, _ height: Double)
        -> Window
    {
        Window(titled: title, width: width, height: height)
    }

}

extension App: NSApplicationDelegate {

    func applicationShouldTerminateAfterLastWindowClosed(
        _ sender: NSApplication
    ) -> Bool {
        self.quitsWhenAllWindowsClosed
    }

}
