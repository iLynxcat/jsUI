const window = App.makeWindow("Hello from JS!", 640, 480)
window.center()

const button = window.makeButton()
button.text = `0 presses`
button.enabled = true

let count = 0
button.onClick = () => {
    count++;
    window.presentInfo("Press again to increment.", `Hello (${getCountString(count)})`);
    button.text = getCountString(count);
}

function getCountString(count) {
    return `${count} press${count == 1 ? '' : 'es'}`
}

App.quitsWhenAllWindowsClosed = true
App.run()
