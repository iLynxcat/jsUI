import AppKit
import JavaScriptCore

@objc final class Console: NSObject, JSModule {

    typealias LogFn = (@convention(block) (String) -> Void)

    static func install(in context: JSContext) {
        let consoleLog = makeConsoleLog()

        //        let console = JSValue(newObjectIn: context)
        //        console?.setObject(
        //            unsafeBitCast(consoleLog, to: AnyObject.self),
        //            forKeyedSubscript: "log" as NSString
        //        )
        //        context.setObject(console, forKeyedSubscript: "console" as NSString)

        context.setObject(
            unsafeBitCast(consoleLog, to: AnyObject.self),
            forKeyedSubscript: "print" as NSString
        )
    }

    private static func makeConsoleLog() -> LogFn {
        { line in
            print("[JS] \(line)")
        }
    }

}

private let nilErrorMessages = [
    "How did we get here?",
    "Uhh, what?",
    "I'm scared.",
    "I just shipped my pants.",
]
private func getRandomNilErrorMessage() -> String {
    nilErrorMessages.randomElement()
        ?? "Also, random message failed to pick. This is probably a big bug, or your system is FUBAR."
}
