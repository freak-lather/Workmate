//
//  EndPointApiProtocol.swift
//  ClockInOut
//
//  Created by ven2aj on 22/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//
// This contains the final api url to fetch the data from server
import Foundation
protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
