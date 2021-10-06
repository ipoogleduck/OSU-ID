//
//  IDVC.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/4/21.
//

import UIKit

class IDVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nextButton: UIBarButtonItem!
    @IBOutlet var titleTopConstraint: NSLayoutConstraint!
    @IBOutlet var IDTextFieldBKView: UIView!
    @IBOutlet var IDTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IDTextFieldBKView.layer.cornerRadius = 15
        if hasOpenedMainScreen {
            nextButton.title = "Save"
        }
        nextButton.isEnabled = false
        IDTextField.delegate = self
        if let idNumber = idNumber {
            IDTextField.text = addDashes(to: idNumber)
        }
        IDTextField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        IDTextField.becomeFirstResponder()
    }
    
    func isValidID() -> Bool {
        guard let text = IDTextField.text else { return false }
        let cleanText = cleanText(text)
        if cleanText.count == 9 && cleanText.isNumber {
            return true
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        
        
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if updatedText.count <= 11 {
            return true
        } else {
            IDTextField.textColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.IDTextField.textColor = .label
            }
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            return false
        }
    }
    
    @IBAction func IDTextFeild(_ sender: Any) {
        let text = IDTextField.text ?? ""
        
        let cleanNumber = cleanText(text)
        
        IDTextField.text = addDashes(to: cleanNumber)
        
        nextButton.isEnabled = isValidID()
    }
    
    func addDashes(to id: String) -> String {
        var newText = ""
        for i in 0 ..< id.count {
            if i == 3 || i == 6 {
                newText.append("-")
            }
            newText.append(id[i])
        }
        return newText
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let id = cleanText(IDTextField.text!)
        idNumber = id
        UserDefaults.save(id, key: .idNumber)
        if hasOpenedMainScreen {
            navigationController?.popViewController(animated: true)
        } else {
            performSegue(withIdentifier: "toNameSegue", sender: self)
        }
    }
    
    func cleanText(_ text: String) -> String {
        text.replacingOccurrences(of: "-", with: "")
    }
    
    
}


extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
