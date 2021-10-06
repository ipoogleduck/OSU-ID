//
//  NameVC.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/5/21.
//

import UIKit
import WidgetKit

class NameVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var skipButton: UIBarButtonItem!
    @IBOutlet var nameTextFieldBKView: UIView!
    @IBOutlet var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextFieldBKView.layer.cornerRadius = 15
        if hasOpenedMainScreen {
            skipButton.title = "Save"
        }
        nameTF.text = name
        nameTF.delegate = self
        nameTF.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameTF.becomeFirstResponder()
    }
    
    func isValidName() -> Bool {
        guard let text = nameTF.text else { return false }
        if text != "" {
            return true
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 30
    }
    
    @IBAction func skipButton(_ sender: Any) {
        if isValidName() || hasOpenedMainScreen {
            var text: String? = nameTF.text
            if text == "" {
                text = nil
            }
            name = text
            UserDefaults.save(text, key: .name)
        }
        if hasOpenedMainScreen {
            if #available(iOS 14.0, *) {
                WidgetCenter.shared.reloadAllTimelines()
            }
            navigationController?.popViewController(animated: true)
        } else {
            performSegue(withIdentifier: "toHomeSegue", sender: self)
        }
    }
    
    @IBAction func nameTF(_ sender: Any) {
        if isValidName() && !hasOpenedMainScreen {
            skipButton.title = "Done"
        } else if !hasOpenedMainScreen {
            skipButton.title = "Skip"
        }
    }
    
}
