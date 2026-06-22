const window = App.makeWindow("Hello from JS!", 640, 480)
window.center()

const button = window.makeButton()
button.text = `0 presses`
button.enabled = true

let count = 0
button.onClick = () => {
    count++;
    window.showAlert(`Hello (${count} presses)`, "Press again to increment.");
    button.text = `${count} presses`;
}

App.run()
