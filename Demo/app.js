const window = App.makeWindow("Hello from JS!", 640, 480)
window.center()

const button = window.makeButton()
button.text = `0 presses`
button.enabled = true

let count = 0
button.onClick = () => {
    count++;
    window.showAlert(`Hello (${getCountString(count)})`, "Press again to increment.");
    button.text = getCountString(count);
}

function getCountString(count) {
    return `${count} press${count == 1 ? '' : 'es'}`
}

App.run()
