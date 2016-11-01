//
//  ItemModel.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/1.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import ObjectMapper

class ItemModel: NSObject, Mappable {
    var from: String?
    var id: Int?
    var like: Int?
    var look: Int?
    var type: Int?

    var title: String?
    var img: String?
    var root_type: String?
    var tags: String?
    var url: String?


    required init?(map: Map) {

    }
    func mapping(map: Map) {
        from <- map["from"]
        id   <- map["id"]
        like <- map["like"]
        look <- map["look"]
        title <- map["title"]
        img <- map["img"]
        root_type <- map["root_type"]
        tags <- map["tags"]
        type <- map["type"]
        url <- map["url"]
    }
}
