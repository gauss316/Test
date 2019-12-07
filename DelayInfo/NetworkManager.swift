//
//  NetworkManager.swift
//  DelayInfo
//
//  Created by 石坂拓哉 on 2019/10/19.
//  Copyright © 2019 Takuya Ishizaka. All rights reserved.
//

import Foundation
import RealmSwift

class Model: Object, Codable{
    @objc dynamic var name: String = ""
    @objc dynamic var company: String = ""
    @objc dynamic var lastupdate_gmt: Int64 = 0
    @objc dynamic var update: String? = ""

    override public static func primaryKey() -> String? {
        return "name"
    }
}

class NetworkManager: ObservableObject{
    
    @Published var model: [Model] = []
    let urllink = "https://tetsudo.rti-giken.jp/free/delay.json"
    
    init() {
        URLSession.shared.dataTask(with: URL(string: urllink)!) { (data, response, error) in
            guard let data = data else { return }
            let task = try! JSONDecoder().decode([Model].self, from: data)
            DispatchQueue.main.async {
                for i in 0 ..< task.count {
                    let date = NSDate(timeIntervalSince1970: TimeInterval(task[i].lastupdate_gmt))
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let dateStr: String = formatter.string(from: date as Date)
                    task[i].update = dateStr
                }
                let realm = try! Realm()
                try! realm.write {
                    realm.deleteAll()
                    realm.add(task)
                }
                let result = Array(realm.objects(Model.self))
                self.model = result
                print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
        }.resume()
    }
}
