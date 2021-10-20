//
//  ViewController.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/3/21.
//

import UIKit

var hasOpenedMainScreen = false

var userBarcodeImage: UIImage?

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
        reloadName()
        barcodeImage.image = userBarcodeImage
//        if lastPage == 1 {
//            lastBrightness = UIScreen.main.brightness
//            UIScreen.main.brightness = 1
//            lastPage = 0
//        }
    }
    
    func reloadBarcode() {
        if let data = UserDefaults.getData(key: .barcodeImage) {
            userBarcodeImage = UIImage(data: data)
            barcodeImage.image = userBarcodeImage
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

