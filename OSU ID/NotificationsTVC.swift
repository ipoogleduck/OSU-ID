//
//  NotificationsTVC.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/5/21.
//

import UIKit

struct PlaceStruct: Codable {
    var name: String
    var lat: String
    var lon: String
    var isEnabled: Bool
}

class NotificationsTVC: UITableViewController {
    
    var places = [
        PlaceStruct(name: "West Dining", lat: "", lon: "", isEnabled: true),
        PlaceStruct(name: "McNary Dining", lat: "", lon: "", isEnabled: true),
        PlaceStruct(name: "Arnold Dining", lat: "", lon: "", isEnabled: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return places.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicSwitchCell", for: indexPath) as! BasicSwitchCell
            
            cell.titleLabel.text = "Enable Notifications"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTextCell", for: indexPath) as! BasicTextCell
            
            let place = places[indexPath.row]
            
            cell.titleLabel.text = place.name
            
            if place.isEnabled {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "A notification prompting you to open your ID card will appear on your lock screen when you enter any of the following areas"
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = places[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath) as? BasicTextCell {
            if !place.isEnabled {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        places[indexPath.row].isEnabled = !place.isEnabled
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

class BasicSwitchCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mainSwitch: UISwitch!
    
}

class BasicTextCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
}
