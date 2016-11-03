//
//  LiftListModel.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/11/1.
//  Copyright © 2016年 genju. All rights reserved.
//

import UIKit
import ObjectMapper

class LiftListModel: NSObject, Mappable  {
    var dayDic: [String : Any] = [:]
    var list: [ItemModel]?
    var tagArray: [Any]?


    required init?(map: Map) {

    }
    func mapping(map: Map) {
        dayDic <- map["day"]
        list <- map["list"]
        tagArray <- map["tags"]
    }

}
