import Foundation
import jsUI

let runtime = JSRuntime()

guard let scriptUrl = Bundle.main.url(forResource: "app", withExtension: "js")
else {
    fatalError("app.js not found in bundle")
    // macOS .app bundle MUST contain a file at APPNAME.app/Contents/Resources/app.js
    // See Demo/ in repo root for a main.swift that does not require an app bundle.
}

guard let data = try? Data(contentsOf: scriptUrl)
else {
    fatalError("Could not read app.js")
    // app.js was found in bundle, but was somehow unreadable?
    // Please contribute notes if you encounter this!
}

guard let source = String(data: data, encoding: .utf8)
else {
    fatalError("Could not decode app.js")
    // app.js was found in bundle, read, but not decodable as UTF-8.
    // Please contribute notes if you encounter this!
}

runtime.run(script: source)
