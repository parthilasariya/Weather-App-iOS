//
//  Current+Extension.swift
//  WeatherApp
//
//  Created by Parth Ilasariya on 2021-12-20.
//

import Foundation
import CoreLocation

extension Daily {
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let df = DateFormatter()
        df.dateFormat = "EEEE"
        return Calendar.current.isDateInToday(date) ? "Today" : df.string(from: date)
    }
    
    var formattedTemp: String {
        "\(Int(temp.min)) / \(Int(temp.max))º"
    }
    
    var formattedDescription: String {
        "• \(weather.first?.weatherDescription.capitalized ?? "No Description")"
    }
    
    var iconName: String {
        let iconName = String(weather.first?.id ?? 200)
        print(iconName)
        return (WeatherService.shared.icons[iconName]?.icon ?? "cloud") + ".fill"
    }
}

extension Hourly {
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        return df.string(from: date)
    }
    
    var formattedTemp: String {
        "\(Int(temp))º"
    }
    
    var iconName: String {
        let iconName = String(weather.first?.id ?? 200)
        print(iconName)
        return (WeatherService.shared.icons[iconName]?.icon ?? "cloud") + ".fill"
    }
}

extension Current {
    
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(dt))
        let df = DateFormatter()
        df.dateFormat = "E, d MMM"
        return df.string(from: date)
    }
    
    var formattedTemp: String {
        "\(Int(temp))º"
    }
    
    var iconName: String {
        let iconName = String(weather.first?.id ?? 200)
        print(iconName)
        return (WeatherService.shared.icons[iconName]?.icon ?? "cloud") + ".fill"
    }
}
