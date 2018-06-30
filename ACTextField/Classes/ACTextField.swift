//
//  ACTextField.swift
//  AutoComplete
//
//  Created by VARSHNEY on 30/06/18.
//  Copyright © 2018 VARSHNEY. All rights reserved.
//

import UIKit
public protocol ACTextFieldDelegate {
    func  ACTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
}

public class ACTextField: UITextField,UITextFieldDelegate {
    
    public var ACDelegate  : ACTextFieldDelegate?
    public var strictMode = false
    private var ACDelegateResult = true
    private var autoCompleteDataSet = [String]()
    private var autoCompleteCharacterCount = 0
    private var timer = Timer()
    private var suggestionColor = UIColor.lightGray
    @IBInspectable public var suggestionTextColor:UIColor = UIColor.lightGray {
        didSet{
            self.suggestionColor = self.suggestionTextColor
        }
    }
    public func setAutoCompleteWith(DataSet dataSet:[String]){
        autoCompleteDataSet = dataSet
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        
    }
    
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { //1
        if let del = ACDelegate?.ACTextField(self, shouldChangeCharactersIn: range, replacementString: string){
            ACDelegateResult = del
        }
        var subString = (textField.text! as NSString).replacingCharacters(in: range, with: string) // 2
        subString = formatSubstring(subString: subString)
        
        if subString.count == 0 { // 3 when a user clears the textField
            resetValues()
        } else {
            searchAutocompleteEntriesWIthSubstring(substring: subString) //4
        }
        
        return ACDelegateResult
        
    }
    private func formatSubstring(subString: String) -> String {
        if strictMode{
            let formatted = String(subString.dropLast(autoCompleteCharacterCount)) //5
            return formatted
        }
        let formatted = String(subString.dropLast(autoCompleteCharacterCount).capitalized) //5
        return formatted
    }
    
    
    
    private func resetValues() {
        autoCompleteCharacterCount = 0
        self.text = ""
    }
    
    
    private func searchAutocompleteEntriesWIthSubstring(substring: String) {
        let userQuery = substring
        let suggestions = getAutocompleteSuggestions(userText: substring) //1
        if suggestions.count > 0 {
            if #available(iOS 10.0, *) {
                timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //2
                    let autocompleteResult = self.formatAutocompleteResult(substring: substring, possibleMatches: suggestions) // 3
                    self.putColourFormattedTextInTextField(autocompleteResult: autocompleteResult, userQuery : userQuery) //4
                    self.moveCaretToEndOfUserQueryPosition(userQuery: userQuery) //5
                })
            } else {
                // Fallback on earlier versions
            }
        } else {
            if #available(iOS 10.0, *) {
                timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //7
                    if self.ACDelegateResult{
                        self.text = substring
                    }
                    
                })
            } else {
                // Fallback on earlier versions
            }
            autoCompleteCharacterCount = 0
        }
    }
    
    private func getAutocompleteSuggestions(userText: String) -> [String]{
        var possibleMatches: [String] = []
        for item in autoCompleteDataSet { //2
            let myString:NSString! = item as NSString
            let substringRange :NSRange! = myString.range(of: userText)
            
            if (substringRange.location == 0)
            {
                possibleMatches.append(item)
            }
        }
        return possibleMatches
    }
    
    private func putColourFormattedTextInTextField(autocompleteResult: String, userQuery : String) {
        let colouredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autocompleteResult)
        colouredString.addAttribute(NSAttributedStringKey.foregroundColor, value: suggestionTextColor, range: NSRange(location: userQuery.count,length:autocompleteResult.count))
        if ACDelegateResult{
            self.attributedText = colouredString
        }
        
    }
    private func moveCaretToEndOfUserQueryPosition(userQuery : String) {
        if let newPosition = self.position(from: self.beginningOfDocument, offset: userQuery.count) {
            self.selectedTextRange = self.textRange(from: newPosition, to: newPosition)
        }
        let selectedRange: UITextRange? = self.selectedTextRange
        self.offset(from: self.beginningOfDocument, to: (selectedRange?.start)!)
    }
    private func formatAutocompleteResult(substring: String, possibleMatches: [String]) -> String {
        var autoCompleteResult = possibleMatches[0]
        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count))
        autoCompleteCharacterCount = autoCompleteResult.count
        return autoCompleteResult
    }
    
}

