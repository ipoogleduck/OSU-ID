//
//  SettingsTVC.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/5/21.
//

import UIKit

class SettingsTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
