//
//  Client.swift
//  ClockInOut
//
//  Created by ven2aj on 22/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct Client: Codable {
    let name: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
