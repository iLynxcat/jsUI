import JavaScriptCore

protocol JSModule {
	static func install(in context: JSContext)
}

protocol View {
    func child(_ view: any View)
}

extension View {
    func child(_ view: any View) {}
}
