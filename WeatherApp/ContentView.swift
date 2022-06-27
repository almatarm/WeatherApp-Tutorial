//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mufeed AlMatar on 28/11/1443 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityNameView(cityName: "Cupertino, CA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temperture: 76)
                
                HStack(spacing: 20) {
                    DayWeatherView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperture: 74)
                    DayWeatherView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperture: 70)
                    DayWeatherView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperture: 66)
                    DayWeatherView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperture: 60)
                    DayWeatherView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperture: 55)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time")
                }
                
                Spacer()
            }
        }
    }
    
}

struct DayWeatherView: View {
    var dayOfWeek: String
    var imageName: String
    var temperture: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperture)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(
                        colors: [isNight ? .black : .blue,
                                 isNight ? .gray : Color("Light Blue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperture: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperture)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
