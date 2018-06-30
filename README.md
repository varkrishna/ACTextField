# ACTextField

[![CI Status](https://img.shields.io/travis/varkrishna/ACTextField.svg?style=flat)](https://travis-ci.org/varkrishna/ACTextField)
[![Version](https://img.shields.io/cocoapods/v/ACTextField.svg?style=flat)](https://cocoapods.org/pods/ACTextField)
[![License](https://img.shields.io/cocoapods/l/ACTextField.svg?style=flat)](https://cocoapods.org/pods/ACTextField)
[![Platform](https://img.shields.io/cocoapods/p/ACTextField.svg?style=flat)](https://cocoapods.org/pods/ACTextField)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ACTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ACTextField'
```
## Use
To import library
```swift
import ACTextField
````
To give Data Set
```swift
yourACTextField..setAutoCompleteWith(DataSet: ["Apple","Mango","Orange"])
````
To set its delegate 
```swift
yourACTextField.ACDelegate = self
````
```swift
func ACTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
````
To set its suggestion TextColor ,  By default it is light gray
```swift
yourACTextField.suggestionTextColor = UIColor.yellow
````
## Author

varkrishna, krishan.varshney708@gmail.com

## License

ACTextField is available under the MIT license. See the LICENSE file for more info.
