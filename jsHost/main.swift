import jsUI

let runtime = JSRuntime()

let script = """
let window = App.makeWindow("App", 640, 480)
window.center()

let button = window.makeButton()
button.text = "Hello, James"
button.enabled = true

let c = 0
button.onClick = () => { c++; window.showAlert("hi", `how are u (${c})`); button.text = c }

App.run()
"""

runtime.run(script: script)
