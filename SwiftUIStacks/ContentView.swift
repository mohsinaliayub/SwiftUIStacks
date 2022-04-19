//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Mohsin Ali Ayub on 19.04.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack {
                PricingView(title: "Basic", price: "$9", textColor: .white,
                            backgroundColor: .purple)
                
                ZStack {
                    PricingView(title: "Pro", price: "$19", textColor: .black,
                                backgroundColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 1, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                    
                    
                }
            }
            .padding()
            
            PricingView(title: "Team", price: "$299", textColor: .white,
                        backgroundColor: Color(red: 62/255, green: 63/255, blue: 70/255), systemImageName: "wand.and.rays")
                .padding()
                .overlay(
                    Text("Perfect for teams with 20 members")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 1, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: -10)
                    ,
                    alignment: .bottom
                )
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Choose")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                Text("Your Plan")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    
    let title: String
    let price: String
    let textColor: Color
    let backgroundColor: Color
    var systemImageName: String?
    
    var body: some View {
        VStack {
            if let systemImageName = systemImageName {
                Image(systemName: systemImageName)
                    .font(.largeTitle)
            }
            
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
            Text("per month")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(backgroundColor)
        .cornerRadius(10)
        .foregroundColor(textColor)
    }
}
