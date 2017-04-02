//
//  WeatherLocation.swift
//  Weather Gift
//
//  Created by Amanda Gilmour on 3/26/17.
//  Copyright © 2017 Amanda Gilmour. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = -999.9
    var dailySummary = ""
    var currentIcon = ""
    var currentTime = 0.0
    var timeZone = ""
    
    func getWeather(completed: @escaping () -> ()) {
        
        let weatherURL = urlBase + urlAPIKey + coordinates
        print(weatherURL)
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    print("TEMP inside getWeather = \(temperature)")
                    self.currentTemp = temperature
                } else {
                    print("Could not return a temperature!")
                }
                if let summary = json["daily"]["summary"].string {
                    print("SUMMARY inside getWeather = \(summary)")
                    self.dailySummary = summary 
                } else {
                    print("Could not return a summary!")
                }
                if let icon = json["currently"]["icon"].string {
                    print("ICON inside getWeather = \(icon)")
                    self.currentIcon = icon
                } else {
                    print("Could not return an icon!")
                }
                if let time = json["currently"]["time"].double {
                    print("TIME inside getWeather = \(time)")
                    self.currentTime = time
                } else {
                    print("Could not return a time!")
                }
                if let timeZone = json["timezone"].string {
                    print("TIMEZONE inside getWeather = \(timezone)")
                    self.timeZone = timeZone
                } else {
                    print("Could not return a timezone!")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
