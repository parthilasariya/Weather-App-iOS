//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Parth Ilasariya on 2021-12-20.
//

import SwiftUI

struct HourlyForecastView: View {
    let hourlyForecast: [Hourly]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(Array(hourlyForecast.enumerated()), id: \.offset) { offset, forecast in
                    VStack(spacing: 25) {
                        Text(offset == 0 ? "Now" : forecast.formattedDate)
                            .fontWeight(.heavy)
                            .font(.system(size: 18))
                        Image(systemName: forecast.iconName)
                        Text(forecast.formattedTemp)
                            .fontWeight(.medium)
                            .font(.system(size: 16))
                    }
                    .frame(width: 99, height: 163)
                    .background(offset == 0 ? Color.yellow : Color.orange)
                    .modifier(CardModifier())
                }
            }.padding([.top, .bottom])
        }
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(hourlyForecast: WeatherService.shared.json.hourly)
    }
}
