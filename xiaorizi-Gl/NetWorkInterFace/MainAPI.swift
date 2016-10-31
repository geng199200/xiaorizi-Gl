//
//  MainAPI.swift
//  xiaorizi-Gl
//
//  Created by 66 on 2016/10/28.
//  Copyright © 2016年 genju. All rights reserved.
//

import Foundation
import Moya
import Alamofire


// MARK: - Provider Setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
         return data //fallback to original data if it cant be serialized
    }
}

let mainProvider = MoyaProvider<MainAPI>()


// MARK: - Provider support

private extension String {
    var urlEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum MainAPI {
    case life(String)
    case i
}

extension MainAPI: TargetType {
    public var baseURL: URL {
        return URL.init(string: "http://apiv2.xiaorizi.me/volatile/life/?app_token=EA196B4A7AB4A271&channel=iTunes&offset=30&page=1&token_time=1477383779&uuid=B2FDB824-8505-4AA4-A50C-B1A2A4A94D19&version=3.2.0")!
    }
    public var path: String {
        switch self {
        case .life(let name):
            return "me/\(name.urlEscapedString)/life"
        default:
            return ""
        }
    }

    public var method: Moya.Method {
        return .GET
    }

    public var parameters: [String: Any]? {
        switch self {
        case .life(_):
            return [:]
        default:
            return nil
       }

    }

    public var task: Task {
        return .request
    }

    public var sampleData: Data {
        switch self {
        case .life(let name):
            return "{\(name)}".data(using: String.Encoding.utf8)!
        default:
            return "".data(using: String.Encoding.utf8)!
        }
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

