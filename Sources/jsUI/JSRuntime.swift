import JavaScriptCore

public final class JSRuntime {

    let virtualMachine = JSVirtualMachine()
    let context: JSContext

    public init() {
        self.context = JSContext(virtualMachine: virtualMachine)

        context.exceptionHandler = self.handleException

        let modules: [JSModule.Type] = [
            App.self,
            Console.self,
        ]
        modules.forEach { mod in
            mod.install(in: context)
        }
    }

    private func handleException(_: JSContext?, ex: JSValue?) {
        print(
            "A JavaScript exception occurred: \(ex?.toString() ?? "<<unknown>>")"
        )
        exit(1)
    }

    public func run(script: String) {
        context.evaluateScript(script)
    }

}
