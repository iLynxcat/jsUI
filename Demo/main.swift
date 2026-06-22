import Foundation
import jsUI

let runtime = JSRuntime()

guard let scriptUrl = Bundle.module.url(forResource: "app", withExtension: "js")
else {
    fatalError("app.js not found in bundle")
}

guard let data = try? Data(contentsOf: scriptUrl)
else {
    fatalError("Could not read app.js")
}

guard let source = String(data: data, encoding: .utf8)
else {
    fatalError("Could not decode app.js")
}

runtime.run(script: source)
