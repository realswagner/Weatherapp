//
//  SplashScreen.swift
//  WeatherApp
//
//  Created by cmStudent on 2025/04/13.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        }
        else{
            VStack {
                VStack {
                    Image(systemName: "sun.haze.fill")
                        .font(.system(size: 90))
                        .foregroundColor(.red)
                        .padding()
                    Text("天気友達")
                        .font(Font.custom("Baskerville-Bold", size: 30))
                
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
       
    }
}

struct SplashScreenView_Previews: PreviewProvider{
    static var previews: some View {
        SplashScreenView()
    }
}
