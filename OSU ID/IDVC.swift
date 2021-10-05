//
//  IDVC.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/4/21.
//

import UIKit

class IDVC: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var titleTopConstraint: NSLayoutConstraint!
    @IBOutlet var IDTextFeildBKView: UIView!
    @IBOutlet var IDTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IDTextFeildBKView.layer.cornerRadius = 15
    }
    
    @IBAction func IDTextFeild(_ sender: Any) {
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
    }
    
    
}
