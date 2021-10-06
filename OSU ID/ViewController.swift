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

    @IBOutlet var IDBKView: UIView!
    @IBOutlet var barcodeImage: UIImageView!
    @IBOutlet var nameHeaderLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hasOpenedMainScreen = true
        IDBKView.layer.cornerRadius = 15
        IDBKView.layer.shadowColor = UIColor.black.cgColor
        IDBKView.layer.shadowOpacity = 0.3
        IDBKView.layer.shadowOffset = CGSize(width: 0, height: 10)
        IDBKView.layer.shadowRadius = 20
        reloadBarcode()
        reloadName()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadBarcode()
        reloadName()
    }
    
    func reloadBarcode() {
        if let idNumber = idNumber {
            barcodeImage.image = RSUnifiedCodeGenerator.shared.generateCode((idNumber), machineReadableCodeObjectType: AVMetadataObject.ObjectType.code39.rawValue)
        }
    }
    
    func reloadName() {
        if let name = name {
            nameLabel.text = name
            nameLabel.isHidden = false
            nameHeaderLabel.isHidden = false
        } else {
            nameLabel.isHidden = true
            nameHeaderLabel.isHidden = true
        }
    }


}

