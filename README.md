# jsUI
Experimental implementation of a JavaScript-based desktop app framework. Runs in JavaScriptCore, wraps AppKit APIs for macOS.
## Products
- **jsUI** is the package that defines the API and manages the JavaScript runtime.
- **jsHost** is an executable, designed to be placed inside of a Mac application bundle alongside an `app.js`.
- **Demo** contains an easily runnable, tinkerable app for testing out jsUI.
## Running the demo
1. Clone this repository.
2. Run the demo application using `swift run Demo`.
3. Inspect and edit *Sources/Demo/app.js* to get a feel for working with jsUI.
