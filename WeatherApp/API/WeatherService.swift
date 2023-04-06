//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Parth Ilasariya on 2021-12-20.
//

import Foundation
import CoreLocation
import Combine

final class WeatherService: ObservableObject {
    static let shared = WeatherService()
    var objectWillChange: PassthroughSubject<String, Never> = .init()
    @Published var city = "Loading..."
    
    var json: API {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "WeatherResponse", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return try! decoder.decode(API.self, from: data)
    }
    
    struct WeatherSymbol: Codable {
        let icon: String
        let label: String
    }
    
    var icons: [String: WeatherSymbol] {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "Icons", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return try! decoder.decode([String: WeatherSymbol].self, from: data)
    }
    
    func fetchCity() {
        CLGeocoder().reverseGeocodeLocation(.init(latitude: json.lat, longitude: json.lon)) { placemarks, error in
            let city = placemarks?.first.flatMap {
                "\($0.locality ?? ""), \($0.administrativeArea ?? "")"
            } ?? "Error..."
            self.city = city
            self.objectWillChange.send(city)
        }
    }
}
