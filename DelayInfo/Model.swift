//
//  Model.swift
//  DelayInfo
//
//  Created by 石坂拓哉 on 2019/12/07.
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
