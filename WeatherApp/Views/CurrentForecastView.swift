//
//  CurrentForecastView.swift
//  WeatherApp
//
//  Created by Parth Ilasariya on 2021-12-20.
//

import SwiftUI

struct CurrentForecastView: View {
    let current: Current
    let city: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: current.iconName)
                    .foregroundColor(.red)
                VStack(alignment: .leading) {
                    Text("Today")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Text(current.formattedDate)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
            
            Text(current.formattedTemp)
                .font(.system(size: 80))
                .fontWeight(.light)
                .foregroundColor(.red)
            
            Text(city)
                .font(.system(size: 16))
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color.yellow)
        .cornerRadius(8)
        .shadow(color: .init(.sRGB, white: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
    }
}

struct CurrentForecastView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentForecastView(current: WeatherService.shared.json.current, city: "Toronto, ON")
    }
}
