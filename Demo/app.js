print("Initializing via JS…")

const window = App.makeWindow("Calculator Spawner", 640, 480)
window.center()

const btnSpawnCalculator = window.makeButton()
btnSpawnCalculator.text = "Spawn a Calculator!"
btnSpawnCalculator.enabled = true

let count = 0
btnSpawnCalculator.onClick = () => {
    let calc = App.makeWindow("Calculator", 240, 360)
    calc.center()
    
    let prevInput = undefined
    let input = ""
    
    const btn1 = calc.makeButton(), btn2 = calc.makeButton(), btn3 = calc.makeButton()
    const btn4 = calc.makeButton(), btn5 = calc.makeButton(), btn6 = calc.makeButton()
    const btn7 = calc.makeButton(), btn8 = calc.makeButton(), btn9 = calc.makeButton()
    const btn0 = calc.makeButton(), btnEq = calc.makeButton()
    
    btn0.text = "0"
    btn1.text = "1"
    btn2.text = "2"
    btn3.text = "3"
    btn4.text = "4"
    btn5.text = "5"
    btn6.text = "6"
    btn7.text = "7"
    btn8.text = "8"
    btn9.text = "9"
    btnEq.text = "+"

    btn0.onClick = () => input += "0"
    btn1.onClick = () => input += "1"
    btn2.onClick = () => input += "2"
    btn3.onClick = () => input += "3"
    btn4.onClick = () => input += "4"
    btn5.onClick = () => input += "5"
    btn6.onClick = () => input += "6"
    btn7.onClick = () => input += "7"
    btn8.onClick = () => input += "8"
    btn9.onClick = () => input += "9"
    btnEq.onClick = () => {
        if (prevInput === undefined) {
            prevInput = +input
            input = ""
            btnEq.text = "="
            return
        } else {
            const result = prevInput + (+input)
            print(`${prevInput} + ${+input} = ${result}`)
            prevInput = undefined
            input = ""
            btnEq.text = "+"
        }
    }
    
}

App.quitsWhenAllWindowsClosed = true

print("Starting app via JS…")

App.run()
