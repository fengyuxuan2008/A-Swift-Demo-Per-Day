//
//  Weather.swift
//  TheNinthDay_JSON
//
//  Created by apple on 2017/7/26.
//  Copyright © 2017年 apple. All rights reserved.
//
/*
 GET https://api.darksky.net/forecast/[your key]/[your location]
 {
 "latitude": 47.20296790272209,
 "longitude": -123.41670367098749,
 "timezone": "America/Los_Angeles",
 "daily": {
 
 "data": [
 {
 "time": 1453363200,
 "summary": "Rain throughout the day.",
 "icon": "rain",
 "sunriseTime": 1453391560,
 "sunsetTime": 1453424361,
 "moonPhase": 0.43,
 "precipIntensity": 0.1134,
 "precipIntensityMax": 0.1722,
 "precipIntensityMaxTime": 1453392000,
 "precipProbability": 0.87,
 "precipType": "rain",
 "temperatureMin": 41.42,
 "temperatureMinTime": 1453363200,
 "temperatureMax": 53.27,
 "temperatureMaxTime": 1453417200,
 "apparentTemperatureMin": 36.68,
 "apparentTemperatureMinTime": 1453363200,
 "apparentTemperatureMax": 53.27,
 "apparentTemperatureMaxTime": 1453417200,
 
 },
 ...
 ]
 },
 
 }
 */

import Foundation
struct Weather {
    let summary: String
    let icon: String
    let temperature: Double
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String,Any)
    }
    
    init(json:[String:Any]) throws{
        guard let summary = json["summary"] as? String else{
            throw SerializationError.missing("summary is missing")
        }
        guard let icon = json["icon"] as? String else{
            throw SerializationError
            .missing("icon is missing")
        }
        guard let temperature = json["temperatureMax"] as? Double else{
            throw SerializationError.missing("temperature is missing")
        }
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
    }
    static let basePath = "https://api.darksky.net/forecast/89d9aa0c794f6246d31a675ab2794afc/"
    
    static func forecast (withLocation location:String,completion: @escaping([Weather]) -> ()){
        let url = basePath + location
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var forecastArray:[Weather] = []
            if let data = data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options:[]) as? [String: Any]{
                        if let dailyForecasts = json["daily"] as? [String: Any]{
                            if let dailyData = dailyForecasts["data"] as? [[String: Any]]{
                                for dataPoint in dailyData{
                                    if let weatherObject = try? Weather(json:dataPoint){
                                        forecastArray.append(weatherObject)
                                        
                                    }
                                }
                            }
                        }
                    }
                }catch{
                      print(error.localizedDescription)
                }
                completion(forecastArray)
            }
            
        }
        task.resume()
    }
    
}
