//
//  Utils.swift
//  OSU ID
//
//  Created by Oliver Elliott on 10/6/21.
//

import Foundation

class Utils {
    static func generateBarcodeJSON() -> [String: Any] {
        var newPlaces: [[String: Any]] = []
        for place in places {
            if place.isEnabled {
                newPlaces.append(["latitude": place.lat, "longitude": place.lon])
            }
        }
        return [
            "formatVersion" : 1,
            "passTypeIdentifier" : "pass.com.ipooglecodes.osuidpass",
            "serialNumber" : "p69f2J",
            "teamIdentifier" : "5E845TX3E6",
            "webServiceURL" : "https://example.com/passes/",
            "authenticationToken" : "vxwxd7J8AlNNFPS8k0a0FfUFtq0ewzFdc",
            "locations" : newPlaces,
//            "barcode" : [
//              "message" : "123456789",
//              "format" : "PKBarcodeFormatPDF417",
//              "messageEncoding" : "iso-8859-1"
//            ],
            "organizationName" : "Organic Produce",
            "description" : "Organic Produce Loyalty Card",
            "logoText" : "Organic Produce",
            "foregroundColor" : "rgb(255, 255, 255)",
            "backgroundColor" : "rgb(55, 117, 50)",
            "storeCard" : [
              "primaryFields" : [
                  "key" : "balance",
                  "label" : "remaining balance",
                  "value" : 21.75,
                  "currencyCode" : "USD"
              ],
              "auxiliaryFields" : [
                  "key" : "deal",
                  "label" : "Deal of the Day",
                  "value" : "Lemons"
              ]
            ]
          ]

    }
}
