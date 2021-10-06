//
//  ViewController.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/3/21.
//

import UIKit
import RSBarcodes_Swift
import AVFoundation

var hasOpenedMainScreen = false

class ViewController: UIViewController {

    @IBOutlet var barcodeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hasOpenedMainScreen = true
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadBarcode()
    }
    
    func reloadBarcode() {
        if let idNumber = idNumber {
            barcodeImage.image = RSUnifiedCodeGenerator.shared.generateCode((idNumber), machineReadableCodeObjectType: AVMetadataObject.ObjectType.code39.rawValue)
        }
    }


}

