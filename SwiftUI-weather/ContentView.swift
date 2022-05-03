//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Maxwell on 02/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack {
                CityName(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" :"cloud.sun.fill",
                    temp: isNight ? 32 : 76)
                
                HStack (spacing: 25) {
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: "sun.max.fill",
                        temp: 55)
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.bolt.rain.fill",
                        temp: 21)
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "cloud.sun.fill",
                        temp: 68)
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "tornado",
                        temp: 32)
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "cloud.fill",
                        temp: 54)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: .white)
                }
                Spacer()
                
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
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
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityName: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack (spacing: 5){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}


