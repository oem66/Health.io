//
//  HealthHighlightsView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/25/22.
//

import SwiftUI

// MARK: Health Highlights View to show 3 main health previews
struct HealthHighlightsView: View {
    var body: some View {
        ZStack {
            Color(.white)
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "heart.text.square")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text("85 bpm")
                    .foregroundColor(.black)
                    .padding()
                
                HStack {
                    Image(systemName: "facemask")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding(.trailing, 5)
                    
                    Text("5% Less Than Last month")
                        .foregroundColor(.black)
                        .padding()
                }
                
                ZStack {
                    Color(red: 232/255, green: 255/255, blue: 246/255)
                    Text("30 min Ago")
                        .foregroundColor(.green)
                        .padding()
                }
                
                HStack(alignment: .center) {
                    
                }
            }
        }
        .cornerRadius(20)
    }
}
