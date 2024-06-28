//
//  ContentView.swift
//  week10_mission_api
//
//  Created by 채리원 on 6/19/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var weatherData: WeatherData? = nil
    @State private var isLoading = false
    @State private var errorMessage: String?

    var body: some View {
        ZStack {
            VStack {
                if isLoading {
                    ProgressView("날씨 불러오는 중")
                        .progressViewStyle(CircularProgressViewStyle())
                } else if let weatherData = weatherData {
                    WeatherInfoView(weatherData: weatherData)
                }
                
                Button(action: loadData) {
                    Text("오늘의 날씨는?")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
        }
    }
    
    func loadData() {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=6dcf3c6a0dbcb27bad37aa4660083c85&units=metric") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                
                if let error = error {
                    errorMessage = "Failed to load data: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    errorMessage = "No data received"
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(WeatherData.self, from: data)
                    weatherData = result
                } catch {
                    errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}

struct WeatherInfoView: View {
    let weatherData: WeatherData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("City: \(weatherData.name ?? "Unknown")")
                .font(.title)
                .fontWeight(.bold)
            
            if let conditions = weatherData.weather?.first {
                Text("Weather: \(conditions.main ?? "Unknown")")
                    .font(.headline)
                Text(conditions.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            if let main = weatherData.main {
                Text("Temperature: \(main.temp ?? 0.0, specifier: "%.2f")°C")
                    .font(.body)
                Text("Feels like: \(main.feels_like ?? 0.0, specifier: "%.2f")°C")
                    .font(.body)
                Text("Humidity: \(main.humidity ?? 0)%")
                    .font(.body)
            }
            
            if let wind = weatherData.wind {
                Text("Wind Speed: \(wind.speed ?? 0.0, specifier: "%.2f") m/s")
                    .font(.body)
            }
            
            if let clouds = weatherData.clouds {
                Text("Cloudiness: \(clouds.percentage ?? 0)%")
                    .font(.body)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
