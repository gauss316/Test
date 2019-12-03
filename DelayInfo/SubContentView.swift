//
//  SubContentView.swift
//  DelayInfo
//
//  Created by 石坂拓哉 on 2019/10/19.
//  Copyright © 2019 Takuya Ishizaka. All rights reserved.
//

import SwiftUI

struct SubContentView: View {
    @State var networkManager = NetworkManager()
    
    var body: some View {
        List(self.networkManager.model, id: \.self) { model in
            HStack{
                Text(model.name)
                    .font(.system(size: 20))
                Text(model.company)
            }
        }
        .navigationBarTitle("遅延中の路線")
    }
}


struct SubContentView_Previews: PreviewProvider {
    static var previews: some View {
        SubContentView()
    }
}

