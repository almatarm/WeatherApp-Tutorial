//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Mufeed AlMatar on 28/11/1443 AH.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color = Color.blue
    var backgroundColor : Color = Color.white
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .default))
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
