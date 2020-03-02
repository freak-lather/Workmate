//
//  Address.swift
//  ClockInOut
//
//  Created by ven2aj on 22/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct Address: Codable {
    let street_1: String?

    enum CodingKeys: String, CodingKey {
        case street_1 = "street_1"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street_1 = try values.decodeIfPresent(String.self, forKey: .street_1)
    }

}
