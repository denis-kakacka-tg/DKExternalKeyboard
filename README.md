# DKExternalKeyboard

[![Version](https://img.shields.io/cocoapods/v/DKExternalKeyboard.svg?style=flat)](https://cocoapods.org/pods/DKExternalKeyboard)
[![Platform](https://img.shields.io/cocoapods/p/DKExternalKeyboard.svg?style=flat)](https://cocoapods.org/pods/DKExternalKeyboard)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](video1.gif)

## Installation

DKExternalKeyboard is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DKExternalKeyboard'
```

## Usage

```swift
import DKExternalKeyboard
```

```swift
private lazy var keyboardView: DKExternalKeyboardView = {
    let keyboardView = DKExternalKeyboardView()
    keyboardView.keyboard.setDelegate(self)

    return keyboardView
}()
```

```swift
extension ViewController: DKExternalKeyboardDelegate {
    func didTapSearch(query: String?) {
        keyboardView.keyboard.hide()
    }
}
```

```swift
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardView.keyboard.show(for: textField, on: view)
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let emptyViewForSystemKeyboard = UIView(frame: .zero)
        textField.inputView = emptyViewForSystemKeyboard

        return true
    }
}
```


## Author

Denis Kakačka, deniskakacka@gmail.com

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

DKExternalKeyboard is available under the MIT license. See the LICENSE file for more info.
