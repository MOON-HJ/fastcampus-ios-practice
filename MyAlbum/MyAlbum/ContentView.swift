//
//  ContentView.swift
//  MyAlbum
//
//  Created by 문효재 on 2021/04/04.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue = 0
    @State private var showingAlert = false
    //    @State private var message = "가격은 ￦ \(currentValue) 입니다."
    
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .center){
                Spacer()
                
                Text("My Pets")
                    .baselineOffset(10.0)
                    .font(.title)
                
                Spacer()
                
                Image("dog")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.8, alignment: .center)
                    .clipped()
                
                
                Spacer()
                
                Text("가격은 ￦ \(currentValue) 입니다.")
                    .bold()
                    .font(.title2)
                    .frame(width:  geo.size.width, alignment: .center)
                
                Spacer()
                
                Button("refresh", action: {
                    self.showingAlert = true
                })
                .font(.headline)
                .foregroundColor(.pink)
                
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
