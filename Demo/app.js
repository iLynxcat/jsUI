print("Initializing via JS…")

const window = App.makeWindow("Hello from JS!", 640, 480)
window.center()

const button = window.makeButton()
button.text = getCountString(0)
button.enabled = true

let count = 0
button.onClick = () => {
    count++;
    window.presentInfo("Press again to increment.", `Hello (${getCountString(count)})`);
    button.text = getCountString(count);
}

function getCountString(count) {
    print(`Recalculating count string for count ${count}…`)
    return `${count} press${count == 1 ? '' : 'es'}`
}

App.quitsWhenAllWindowsClosed = true

print("Starting app via JS…")

App.run()
