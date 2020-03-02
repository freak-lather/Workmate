//
//  StaffAPI.swift
//  ClockInOut
//
//  Created by ven2aj on 22/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}
enum StaffApi {
    case staff(id: String)
    case clockIn(id: String)
    case clockOut(id: String)
}

extension StaffApi: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.helpster.tech/v1/"
        case .qa: return ""
        case .staging: return ""
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            return URL(string: "")!
        }
        return url
    }
    
    var path: String {
        switch self {
        case .staff(let id):
            return "staff-requests/\(id)/"
        case .clockIn(let id):
            return "staff-requests/\(id)/clock-in"
        case .clockOut(let id):
            return "staff-requests/\(id)/clock-out"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .staff:
            return .get
        default:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .staff:
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: headers)
        default:
            return .requestParametersAndHeaders(bodyParameters: bodyParameters, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        var headers = [String: String]()
        headers["authorization"] = AppConstant.token + AppConstant.key
        headers["Vary"] = AppConstant.accept
        return headers
    }
    
    var bodyParameters: [String: Any] {
        var parameters = [String: Any]()
        parameters["latitude"] = AppConstant.latitude
        parameters["longitude"] = AppConstant.longitude
        return parameters
    }
}
