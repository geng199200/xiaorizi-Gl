//
//  File.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/10/25.
//  Copyright © 2016年 genju. All rights reserved.
//

import Foundation
import UIKit

let app_token: String = "EA196B4A7AB4A271"
let channel: String = "iTunes"
let token_time: Int = 1477383779
let uuid: String = "B2FDB824-8505-4AA4-A50C-B1A2A4A94D19"
let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String

//MARK: 获取屏幕的宽高

public let screenBounds = UIScreen.main.bounds
public let screenHeight = UIScreen.main.bounds.height
public let screenWidth = UIScreen.main.bounds.width

func RGB(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{

    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    
}





