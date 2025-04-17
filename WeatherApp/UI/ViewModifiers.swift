//
//  ViewModifiers.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/17.
//

import SwiftUI

//** View for Cards displayed in main temperature tab**//


struct WeatherCardView: View {
    
    let iconCode: String?
    let iconName: String?
    let title : String
    let value : String
    //**initializer so that not all values need be passed**//
    init(iconCode: String? = nil, iconName: String? = nil, title: String, value: String) {
            self.iconCode = iconCode
            self.iconName = iconName
            self.title = title
            self.value = value
        }
//
//struct WeatherCardView: View{
//    @State var weatherCardValues: WeatherCardValues
    var body: some View {
        
        ZStack{
            Color(uiColor: .systemGray6)
                .cornerRadius(20)
            HStack{
                if let iconCode = iconCode {
                    WeatherIconView(iconCode: iconCode)
                        .frame(width: 40, height: 40)
                        .padding()// Adjust size
                }
                
                if let iconName = iconName {
                    Image(systemName: iconName)
                        .font(.system(size: 40))
                        .foregroundColor(.blue)
                        .padding()// Optional styling
                }
            
                VStack{
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(value)
                        .font(.headline)
                }
            }
           .padding()
            
        }
        
        .frame(maxWidth: .infinity) // Ensure it stretches properly in parent views
        .fixedSize(horizontal: false, vertical: true)
    }
        
    
}
