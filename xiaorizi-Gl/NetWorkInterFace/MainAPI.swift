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

let mainProvider = MoyaProvider<MainAPI>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])




// MARK: - Provider support

private extension String {
    var urlEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum MainAPI {
    case page(page: Int)
    case i
}

extension MainAPI: TargetType {
    public var baseURL: URL {
        return URL.init(string: "http://apiv2.xiaorizi.me")!
    }
    public var path: String {
        switch self {
        case .page(_):
            return "volatile/life/"
        default:
            return ""
        }
    }

    public var method: Moya.Method {
        return .GET
    }

    public var parameters: [String: Any]? {
        switch self {
        case .page(let page):
            return ["app_token":app_token, "channel":channel, "offset":"30", "page": page, "token_time":token_time, "uuid":uuid, "version":version]

        default:
            return nil
       }

    }

    public var task: Task {
        return .request
    }

    public var sampleData: Data {
        switch self {
        case .page(let page):
            return "{\(page)}".data(using: String.Encoding.utf8)!
        default:
            return "".data(using: String.Encoding.utf8)!
        }
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

let endpointClosure = { (target: MainAPI) -> Endpoint<MainAPI> in
    return Endpoint<MainAPI>(URL: url(route: target), sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
}




