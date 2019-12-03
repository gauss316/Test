//
//  ContentView.swift
//  DelayInfo
//
//  Created by 石坂拓哉 on 2019/10/17.
//  Copyright © 2019 Takuya Ishizaka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
                NavigationLink(destination: SubContentView()){
                    Text("No.1")
                }
                .tabItem{
                    Image(systemName: "1.circle")
                    Text("First")
                }
                Text("No.2")
                    .tabItem{
                        Image(systemName: "2.circle")
                        Text("Second")
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
