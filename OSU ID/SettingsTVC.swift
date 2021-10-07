//
//  SettingsTVC.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/5/21.
//

import UIKit
import MessageUI

var appVersion = ""
var appBuild = ""

class SettingsTVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appVersion = version
        }
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            appBuild = build
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if lastPage != 1, let lastBrightness = lastBrightness {
            UIScreen.main.brightness = lastBrightness
            lastPage = 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 3 {
            if indexPath.row == 0 {
                sendEmail(subject: "OSU ID Feature Suggestion", body: "")
            } else {
                sendEmail(subject: "OSU ID Bug Report", body: "")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 3 {
            var string = "Version \(appVersion)"
            #if DEBUG
                string.append(" build \(appBuild)")
            #endif
            return string
        }
        return nil
    }
    
    func sendEmail(subject: String, body: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["gorowapp@gmail.com"])
            mail.setSubject(subject)
            mail.setMessageBody("\(body)", isHTML: true)
            present(mail, animated: true)
        } else {
            let alert = UIAlertController(title: "No Email Set Up", message: "Set up email in settings to use this feature.", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
        if result == .sent {
            let alert = UIAlertController(title: "Thanks for your feedback!", message: "We'll get back to you if necessary", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true)
        }
    }
    
}
