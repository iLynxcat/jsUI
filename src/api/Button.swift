import AppKit
import JavaScriptCore

@objc protocol ButtonJSExport: JSExport {
    var text: String { get set }
    var enabled: Bool { get set }
    var onClick: JSValue? { get set }
}

@objc final class Button: NSObject {
    let nsButton: NSButton
    private var onClickManaged: JSManagedValue?

    override init() {
        nsButton = NSButton(title: "", target: nil, action: nil)
        super.init()

        nsButton.target = self
        nsButton.action = #selector(handleClick(_:))
    }

    @objc private func handleClick(_ sender: NSButton) {
        onClickManaged?.value?.call(withArguments: [])
    }
}

extension Button: ButtonJSExport {
    var text: String {
        get { nsButton.title }
        set {
            nsButton.title = newValue
            nsButton.sizeToFit()
        }
    }

    var enabled: Bool {
        get { nsButton.isEnabled }
        set { nsButton.isEnabled = newValue }
    }

    var onClick: JSValue? {
        get { onClickManaged?.value }
        set {
            if let old = onClickManaged,
               let vm = old.value?.context?.virtualMachine
            {
                vm.removeManagedReference(old, withOwner: self)
            }

            guard
                let newValue,
                let vm = newValue.context?.virtualMachine
            else {
                onClickManaged = nil
                return
            }
            
            let managed = JSManagedValue(value: newValue)
            vm.addManagedReference(managed, withOwner: self)
            onClickManaged = managed
        }
    }
}
