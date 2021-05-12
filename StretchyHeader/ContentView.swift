//
//  ContentView.swift
//  StretchyHeader
//
//  Created by Ndayisenga Jean Claude on 12/05/2021.
//

import SwiftUI
struct CardData {
    let id: Int
    let title: String
}

struct ContentView: View {
    let appNames = ["Doodle Jum", "Subway Surfers", "Asphalt Racing", "Super Mario", "Cut the Rope"]
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                GeometryReader { proxy in
                    let global = proxy.frame(in: .global)
                    // Header
                    Image("poster")
                        .resizable()
                        .offset(y: global.minY > 0 ? -global.minY : 0)
                        .frame(
                            height: global.minY > 0 ? (UIScreen.main.bounds.height/2.2) + global.minY : UIScreen.main.bounds.height/2.2
                        )
                   
                     
                }
                .frame(height: UIScreen.main.bounds.height/2.2)
                
                VStack {
                    ForEach(1...5, id: \.self) {
                         num in
                        let data = CardData(
                            id: num,
                            title: self.appNames[num - 1]
                        )
                        CardView(data: data)
                            .padding()
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let data: CardData
    
    var body: some View {
        HStack  {
            Image("app\(data.id)")
                .resizable()
                .frame(width:100, height: 100)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(data.title)
                    .bold()
                    .font(.system(size: 24))
                    .padding(3)
                Text("Offers In-App Purchases")
                    .font(.system(size: 17))
            }
            Spacer()
            Button(action: {
                //
            }, label: {
                Text("GET")
                    .padding()
                    .foregroundColor(Color.blue)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
