//
//  NetworkManager.swift
//  DelayInfo
//
//  Created by 石坂拓哉 on 2019/10/19.
//  Copyright © 2019 Takuya Ishizaka. All rights reserved.
//

import SwiftUI
import RealmSwift

class Model: Object, Codable{
    @objc dynamic var name: String = ""
    @objc dynamic var company: String = ""
    @objc dynamic var lastupdate_gmt: Int64 = 0

    override public static func primaryKey() -> String? {
        return "name"
    }
}

class NetworkManager{
    
    var model: [Model]
    init() {
        model = []
        guard let url = URL(string: "https://tetsudo.rti-giken.jp/free/delay.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let task = try! JSONDecoder().decode([Model].self, from: data)
            let realm = try! Realm()
            try! realm.write {
                realm.deleteAll()
                realm.add(task)
            }
            let result = Array(realm.objects(Model.self))
            self.model = result
        }.resume()
    }
}
