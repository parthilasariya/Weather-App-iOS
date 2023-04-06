//
//  ContentView.swift
//  WeatherApp
//
//  Created by Parth Ilasariya on 2021-12-20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherService = WeatherService.shared
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
      
            HStack {
                Spacer()
                Text("Weather forecast")
                Spacer()
                Button(action: {}) {
                    Image("menu-icon")
                }
                
            }.padding([.bottom])
            CurrentForecastView(current: weatherService.json.current, city: weatherService.city)
            
            HourlyForecastView(hourlyForecast: weatherService.json.hourly)
            
            Button(action: {}, label: {
                Text("More details")
                    .foregroundColor(.black)
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            })
            .padding([.bottom])
           
            DailyForecastView(dailyForecast: weatherService.json.daily)
            
        }.onAppear(perform: weatherService.fetchCity)
        .padding()
        .background(Color.gray)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
