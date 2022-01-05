//
//  InterfaceController.swift
//  OSU ID Watch WatchKit Extension
//
//  Created by Oliver Elliott on 1/2/22.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var name: WKInterfaceLabel!
    @IBOutlet weak var mainImage: WKInterfaceImage!
    
    let session = WCSession.default
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        
        session.delegate = self
        session.activate()
        let name = UserDefaults.getString(key: .name)
        let image = UserDefaults.getData(key: .image)
        updateData(with: ["name": name as Any, "image": image as Any])
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    func updateData(with data: [String: Any]) {
        if let text = data["name"] as? String {
            name.setText(text)
            UserDefaults.save(text, key: .name)
        }
        if let imageData = data["image"] as? Data, let image = UIImage(data: imageData) {
            mainImage.setImage(image)
            UserDefaults.save(imageData, key: .image)
        }
    }

}


extension InterfaceController: WCSessionDelegate {
  
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
  }
  
  func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
    updateData(with: message)
  }
}
