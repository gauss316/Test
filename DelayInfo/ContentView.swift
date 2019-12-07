//
//  ContentView.swift
//  DelayInfo
//
//  Created by 石坂拓哉 on 2019/10/17.
//  Copyright © 2019 Takuya Ishizaka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        TabView{
            NavigationView{
                List(self.networkManager.model, id: \.self) { model in
                    VStack(alignment: .leading){
                        HStack{
                            Text(model.name)
                                .font(.system(size: 20))
                            Text(model.company)
                        }
                        Text("最終更新：" + model.update!)
                            .font(.system(size: 15))
                    }
                }
                .navigationBarTitle("遅延中の路線")
            }
                .tabItem{
                    Image(systemName: "1.circle")
                    Text("1st")
            }
            Text("No.2")
                .tabItem{
                    Image(systemName: "2.circle")
                    Text("2nd")
            }
            Text("No.3")
                .tabItem{
                    Image(systemName: "3.circle")
                    Text("3rd")
            }
            Text("No.4")
                .tabItem{
                    Image(systemName: "4.circle")
                    Text("4th")
            }
            Text("No.5")
                .tabItem{
                    Image(systemName: "5.circle")
                    Text("5th")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
