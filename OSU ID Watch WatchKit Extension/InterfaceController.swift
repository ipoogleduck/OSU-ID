//
//  InterfaceController.swift
//  OSU ID Watch WatchKit Extension
//
//  Created by Oliver Elliott on 1/2/22.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var name: WKInterfaceLabel!
    @IBOutlet weak var mainImage: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        if let text = UserDefaults.getString(key: .name) {
            name.setText(text)
        }
        if let data = UserDefaults.getData(key: .barcodeImage), let image = UIImage(data: data) {
            mainImage.setImage(image)
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
